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
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  String toString() {
    return 'Product(id: $id,\n name: $name,\n image: $image,\n description: $description,\n price: $price)';
  }

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'],
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
