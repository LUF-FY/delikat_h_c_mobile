// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/order_product.dart';

class Order {
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? street;
  int? house;
  int? housing;
  int? entrance;
  int? apartment;
  List<OrderProduct>? orderProducts;

  Order();

  Order.personalInfo({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  Order.allInfo({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.street,
    required this.house,
    required this.housing,
    required this.entrance,
    required this.apartment,
    required this.orderProducts,
  });

  void setPersonalInfo(
      String email, String firstName, String lastName, String phoneNumber) {
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.phoneNumber = phoneNumber;
  }

  void setAddressInfo(
      String street, int house, int housing, int entrance, int apartment) {
    this.street = street;
    this.house = house;
    this.housing = housing;
    this.entrance = entrance;
    this.apartment = apartment;
  }

  static Order fromJson(Map<String, dynamic> json) => Order.allInfo(
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        phoneNumber: json['phone_number'] as String,
        street: json['street'] as String,
        house: json['house'] as int,
        housing: json['housing'] as int,
        entrance: json['entrance'] as int,
        apartment: json['apartment'] as int,
        orderProducts: (json['order_products'] as List<dynamic>)
            .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  static Map<String, dynamic> toJson(Order instance) {
    List<Map<String, dynamic>> orderProducts = [];
    if (instance.orderProducts != null) {
      for (OrderProduct op in instance.orderProducts!) {
        orderProducts.add(OrderProduct.toJson(op));
      }
    }

    return <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'street': instance.street,
      'house': instance.house,
      'housing': instance.housing,
      'entrance': instance.entrance,
      'apartment': instance.apartment,
      'order_products': orderProducts,
    };
  }

  // static Map<String, dynamic> toJson(Order instance) => <String, dynamic>{
  //       'email': 'raz@mail.ru',
  //       'first_name': "Erik",
  //       'last_name': "MAga",
  //       'phone_number': "89997777777",
  //       'street': '2',
  //       'house': '3',
  //       'housing': '4',
  //       'entrance': '6',
  //       'apartament': '5',
  //       'order_products': '[{"product_id":"1","quantity":"123"}]',
  //     };

  @override
  String toString() {
    return 'Order(email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, street: $street, house: $house, housing: $housing, entrance: $entrance, apartment: $apartment, orderProducts: $orderProducts)';
  }
}
