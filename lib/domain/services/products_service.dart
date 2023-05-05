import 'package:delikat_h_c_mobile/domain/data_providers/product_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/entity/products_category_class.dart';
import 'package:flutter/material.dart';

class ProductService extends ChangeNotifier {
  final _productDataProvider = ProductDataProvider();


  List<Product> _productsList = [];
  List<Product> get productsList => _productsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<ProductsCategory> _productsCategoriesList = [];

  //получение айди категории

  ProductService();

  Future<void> init() async {
    await loadCategories();
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> loadCategories() async {
    _productsCategoriesList = await _productDataProvider.featchProductsCategories();
    notifyListeners();
  }

  Future<void> loadAllProducts() async {
    _productsList = await _productDataProvider.featchAllProducts();
    notifyListeners();
  }

  Future<void> loadProductsByCategory(int id) async {
    _productsList = await _productDataProvider.featchProductsByCategory(id);
    notifyListeners();
  }
}
