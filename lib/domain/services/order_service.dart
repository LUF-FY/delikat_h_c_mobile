import 'package:delikat_h_c_mobile/domain/data_providers/order_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/order_class.dart';
import 'package:flutter/material.dart';

class OrderService extends ChangeNotifier {
  Order order = Order();

  OrderDataProvider orderDataProvider = OrderDataProvider();

  void setPersonalInfo(
      String email, String firstName, String lastName, String phoneNumber) {
    order.setPersonalInfo(email, firstName, lastName, phoneNumber);
  }

  String? setAddressInfo(String street, String house, String housing,
      String entrance, String apartament) {
    var houseTemp = int.tryParse(house);
    var housingTemp = int.tryParse(housing);
    var entranceTemp = int.tryParse(entrance);
    var apartamentTemp = int.tryParse(apartament);

    if (houseTemp == null) {
      return "Номер дома";
    } else if (housingTemp == null) {
      return "Корпус";
    } else if (entranceTemp == null) {
      return "Номер подъезда";
    } else if (apartamentTemp == null) {
      return "Номер квартиры";
    } else {
      order.setAddressInfo(
          street, houseTemp, housingTemp, entranceTemp, apartamentTemp);
    }
    return null;
  }

  Future<void> sendOrder() async {
    await orderDataProvider.sendOrder(order);
    notifyListeners();
  }
}
