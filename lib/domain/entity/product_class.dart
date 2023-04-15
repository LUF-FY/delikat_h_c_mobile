// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'product_class.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final num price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  String toString() {
    return 'Product(id: $id,\n name: $name,\n image: $image,\n description: $description,\n price: $price)';
  }

  static num _validatePriceFromJson(dynamic price) {
    num? tempPrice;
    if (price is String) {
      print('Price - это Строка');
      tempPrice = num.tryParse(price);
    } else if (price is num) {
      print('Price - это Число');
      tempPrice = price;
    } else {
      Exception('Price type in JSON is not correct.');
    }

    if (tempPrice == null) {
      Exception('Incorrect price parsing. price will be null');
    }
    return tempPrice ?? 0;
  }

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: _validatePriceFromJson(json['price']),
        image: json['image'] as String,
        description: json['description'] as String,
      );

  static Map<String, dynamic> toJson(Product instance) => <String, dynamic>{
        'id': instance.id,
        'name': instance.name,
        'image': instance.image,
        'description': instance.description,
        'price': instance.price,
      };
}
