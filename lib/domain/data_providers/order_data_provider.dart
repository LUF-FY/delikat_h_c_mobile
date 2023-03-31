import 'dart:convert';

import 'package:delikat_h_c_mobile/domain/entity/order_class.dart';
import 'package:http/http.dart' as http;

class OrderDataProvider {
  Future<void> sendOrder(Order order) async {
    try {
      var url = Uri.http('www.plus-pumba.ru', 'orders');
      var headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var json = jsonEncode(Order.toJson(order));

      var response = await http.post(
        url,
        headers: headers,
        body: json,
      );

      print("${response.statusCode}");
      print("${response.headers}");
      print("${response.request}");
    } catch (e) {
      print(e);
    }
  }
}
