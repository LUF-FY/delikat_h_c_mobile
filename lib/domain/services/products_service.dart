import 'package:delikat_h_c_mobile/domain/data_providers/product_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:flutter/material.dart';

class ProductService extends ChangeNotifier {
  final _productDataProvider = ProductDataProvider();

  List<Product> _productsList = [];
  List<Product> get productsList => _productsList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProductService() {
    init();
  }

  init() async {
    _isLoading = true;
    notifyListeners();

    await LoadValue();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> LoadValue() async {
    _productsList = await _productDataProvider.featchProducts();
    notifyListeners();
  }
}
