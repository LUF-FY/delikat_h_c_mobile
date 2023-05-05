import 'dart:convert';

import 'package:delikat_h_c_mobile/data.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/entity/products_category_class.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider {
  Future<List<Product>> featchProductsByCategory(int categoryId) async {
    List<Product> products = [];
    try {
      var url =
          Uri.http('www.plus-pumba.ru', 'products/getCategories/$categoryId');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var productsJson = json.decode(response.body);
        for (var productJson in productsJson) {
          var prod = Product.fromJson(productJson);
          print(prod);
          products.add(prod);
        }
      }
    } catch (e) {
      print(e);
    }

    if (products.isEmpty) {
      products = productData;
    }

    return products;
  }

  Future<List<Product>> featchAllProducts() async {
    List<Product> products = [];
    try {
      var url = Uri.http('www.plus-pumba.ru', 'products');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var productsJson = json.decode(response.body);
        for (var productJson in productsJson) {
          var prod = Product.fromJson(productJson);
          print(prod);
          products.add(prod);
        }
      }
    } catch (e) {
      print(e);
    }

    if (products.isEmpty) {
      products = productData;
    }

    return products;
  }

  Future<List<ProductsCategory>> featchProductsCategories() async {
    List<ProductsCategory> categories = [];
    try {
      var url = Uri.http('www.plus-pumba.ru', 'products/productCategories');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var categoriesJson = json.decode(response.body);
        for (var productJson in categoriesJson) {
          var prodCat = ProductsCategory.fromJson(productJson);
          print(prodCat);
          categories.add(prodCat);
        }
      }
    } catch (e) {
      print(e);
    }

    if (categories.isEmpty) {
      print('Лист категорий пуст');
    }

    return categories;
  }
}
