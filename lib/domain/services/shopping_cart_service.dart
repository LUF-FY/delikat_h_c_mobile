import 'dart:math';

import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

class ShoppingCartService extends ChangeNotifier {
  List<CartItem> cartProducts = [];
  final int _defoltQuantity = 1;

  void addToCart(Product product, BuildContext context) {
    if (getTotal() + product.price > 1000000) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Превышено ограничение по сумме заказа, максимум 1000000'),
      ));
    } else {
      cartProducts.add(CartItem(product: product, quantity: _defoltQuantity));
      notifyListeners();
    }
  }

  bool changeItemQuantity(
      CartItem cartItem, int quantity, BuildContext context) {
    if (getTotal() + cartItem.product.price * quantity > 1000000) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Превышено ограничение по сумме заказа, максимум 1000000'),
      ));
      return false;
    } else {
      cartProducts
          .firstWhere((ci) => ci.product.id == cartItem.product.id)
          .quantity = quantity;
      //print('${cartItem.quantity} change');
      notifyListeners();
      return true;
    }
  }

  void incItemQuantity(CartItem cartItem, BuildContext context) {
    if (getTotal() + cartItem.product.price > 1000000) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Превышено ограничение по сумме заказа, максимум 1000000'),
      ));
    } else {
      cartProducts
          .firstWhere((ci) => ci.product.id == cartItem.product.id)
          .quantity++;
      //print('${cartItem.quantity} inc');
      notifyListeners();
    }
  }

  void decItemQuantity(CartItem cartItem) {
    var tempCi =
        cartProducts.firstWhere((ci) => ci.product.id == cartItem.product.id);
    tempCi.quantity = max(tempCi.quantity - 1, 1);
    //print('${cartItem.quantity} dec');
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    cartProducts.removeWhere((ci) => ci.product.id == cartItem.product.id);
    notifyListeners();
  }

  void clearCart() {
    cartProducts.clear();
    notifyListeners();
  }

  num getTotal() {
    num cartTotal = 0.0;
    for (var element in cartProducts) {
      cartTotal += element.product.price * element.quantity;
    }

    return cartTotal;
  }

  bool isCartItemInCart(CartItem cartitem) {
    return cartProducts.any((ci) => ci.product.id == cartitem.product.id);
  }

  bool isProductInCart(Product product) {
    return cartProducts.any((ci) => ci.product.id == product.id);
  }
}
