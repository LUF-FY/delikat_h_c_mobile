// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  int? apartament;
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
    required this.apartament,
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
      String street, int house, int housing, int entrance, int apartament) {
    this.street = street;
    this.house = house;
    this.housing = housing;
    this.entrance = entrance;
    this.apartament = apartament;
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
        apartament: json['apartament'] as int,
        orderProducts: (json['order_products'] as List<dynamic>)
            .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson(Order instance) => <String, dynamic>{
        'first_name': instance.firstName,
        'last_name': instance.lastName,
        'phone_number': instance.phoneNumber,
        'street': instance.street,
        'house': instance.house,
        'housing': instance.housing,
        'entrance': instance.entrance,
        'apartament': instance.apartament,
        'order_products': instance.orderProducts,
      };

  @override
  String toString() {
    return 'OrderProduct(firstName: $firstName,\n lastName: $lastName,\n phoneNumber: $phoneNumber)';
  }
}
