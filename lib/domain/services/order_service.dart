import 'package:delikat_h_c_mobile/domain/entity/order_class.dart';
import 'package:flutter/material.dart';

class OrderService extends ChangeNotifier {
  Order order = Order();

  void setPersonalInfo(
      String email, String firstName, String lastName, String phoneNumber) {
    order.setPersonalInfo(email, firstName, lastName, phoneNumber);
  }

  //
  // ПРверить на правильность конвертации
  //
  void setAddressInfo(
      String street, String house, String housing, String entrance, String apartament) {
    order.setAddressInfo(street, int.parse(house), int.parse(housing), int.parse(entrance), int.parse(apartament));
  }
}
