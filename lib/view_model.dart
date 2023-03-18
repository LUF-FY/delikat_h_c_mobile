import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class ViewModel extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  ViewModel() {
    LoadValue();
  }

  void LoadValue() async {
    _products = allData;
    notifyListeners();
  }
}
