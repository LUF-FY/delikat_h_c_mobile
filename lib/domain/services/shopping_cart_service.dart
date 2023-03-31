import 'dart:math';

import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

class ShoppingCartService extends ChangeNotifier {
  List<CartItem> cartProducts = [];
  final int _defoltQuantity = 1;

  void addToCart(Product product) {
    cartProducts.add(CartItem(product: product, quantity: _defoltQuantity));
    notifyListeners();
  }

  void incItemQuantity({required CartItem cartItem}) {
    cartProducts
        .firstWhere((ci) => ci.product.id == cartItem.product.id)
        .quantity++;
    print('${cartItem.quantity} inc');
    notifyListeners();
  }

  void decItemQuantity({required CartItem cartItem}) {
    var temp_ci =
        cartProducts.firstWhere((ci) => ci.product.id == cartItem.product.id);
    temp_ci.quantity = max(temp_ci.quantity - 1, 1);
    print('${cartItem.quantity} dec');
    notifyListeners();
  }

  void removeFromCart({required CartItem cartItem}) {
    cartProducts.removeWhere((ci) => ci.product.id == cartItem.product.id);
    notifyListeners();
  }

  void clearCart() {
    cartProducts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    cartProducts.forEach((element) {
      cartTotal += element.product.price * element.quantity;
    });

    return cartTotal;
  }

  bool isCartItemInCart(CartItem cartitem) {
    return cartProducts.any((ci) => ci.product.id == cartitem.product.id);
  }

  bool isProductInCart(Product product) {
    return cartProducts.any((ci) => ci.product.id == product.id);
  }
}
