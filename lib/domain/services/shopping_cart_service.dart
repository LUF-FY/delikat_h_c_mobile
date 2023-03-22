import 'package:delikat_h_c_mobile/domain/entity/goods.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

class ShoppingCartService extends ChangeNotifier {
  List<Product> cartProducts = [];

  void addToCart(Product product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartProducts.removeWhere((p) => p.name == product.name);
    notifyListeners();
  }

  void clearCart() {
    cartProducts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    cartProducts.forEach((element) {
      cartTotal += element.price;
    });

    return cartTotal;
  }

  bool isProductInCart(Product product) {
    return cartProducts.any((p) => p.name == product.name);
  }
}
