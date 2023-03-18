import 'dart:convert';

import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider {
  var products = <Product>[];

  Future<void> featchProducts() async {
    var url = Uri.http('www.plus-pumba.ru', 'products');
    //var url = Uri.parse('http://www.plus-pumba.ru/products');
    var response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    products = <Product>[];

    if (response.statusCode == 200) {
      var productsJson = json.decode(response.body);
      for (var productJson in productsJson) {
        products.add(Product.fromJson(productJson));
      }
    }
  }
}
