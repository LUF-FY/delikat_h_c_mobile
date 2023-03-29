import 'package:delikat_h_c_mobile/domain/entity/order_class.dart';
import 'package:http/http.dart' as http;

class OrderDataProvider {
  Future<void> sendOrder(Order order) async {
    try {
      var url = Uri.http('www.plus-pumba.ru', 'orders');
      var headers = {"Content-type": "application/json"};
      var json = Order.toJson(order);
      print(order);
      print(url);
      var response = await http.post(
        url,
        headers: headers,
        body: json,
      );
      if (response.statusCode == 201) {
        print(response.headers);
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print("-----");
      print(e);
    }
  }
}
