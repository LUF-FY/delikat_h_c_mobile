import 'package:json_annotation/json_annotation.dart';

part 'product_class.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return 'Product(id: $id,\n name: $name,\n image: $image,\n description: $description,\n price: $price)';
  }
}
