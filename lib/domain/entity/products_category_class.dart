// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsCategory {
  final int id;
  final String image;
  final String name;

  ProductsCategory(
    this.id,
    this.image,
    this.name,
  );

  ProductsCategory copyWith({
    int? id,
    String? image,
    String? name,
  }) {
    return ProductsCategory(
      id ?? this.id,
      image ?? this.image,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory ProductsCategory.fromMap(Map<String, dynamic> map) {
    return ProductsCategory(
      map['id'] as int,
      map['image'] as String,
      map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsCategory.fromJson(String source) =>
      ProductsCategory.fromMap(source as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, image: $image, name: $name)';

  @override
  bool operator ==(covariant ProductsCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.image == image && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ name.hashCode;
}
