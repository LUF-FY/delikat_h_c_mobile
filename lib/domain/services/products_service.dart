import 'package:delikat_h_c_mobile/domain/data_providers/product_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

class ProductService extends ChangeNotifier {
  final _productDataProvider = ProductDataProvider();

  List<Product> _productsList = [];
  List<Product> get productsList => _productsList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  ProductService() {
    init();
  }

  init() async {
    await loadValue();
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> loadValue() async {
    _productsList = await _productDataProvider.featchProducts();
    notifyListeners();
  }
}
