import 'package:delikat_h_c_mobile/domain/entity/order_product.dart';

class Order {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String street;
  final int house;
  final int housing;
  final int entrance;
  final int apartament;
  final List<OrderProduct> orderProducts;

  Order({
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

  static Order fromJson(Map<String, dynamic> json) => Order(
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
