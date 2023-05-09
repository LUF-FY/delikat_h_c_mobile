import 'dart:convert';

class ProductsCategory {
  final int id;
  final String image;
  final String category;

  ProductsCategory({
    required this.id,
    required this.image,
    required this.category,
  });

  ProductsCategory copyWith({
    int? id,
    String? image,
    String? category,
  }) {
    return ProductsCategory(
      id: id ?? this.id,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  static ProductsCategory fromJson(Map<String, dynamic> json) =>
      ProductsCategory(
        id: json['id'] as int,
        image: json['image'] as String,
        category: json['category'] as String,
      );

  static Map<String, dynamic> toJson(ProductsCategory instance) =>
      <String, dynamic>{
        'id': instance.id,
        'image': instance.image,
        'category': instance.category,
      };

  @override
  String toString() => 'Category(id: $id, image: $image, category: $category)';

  @override
  bool operator ==(covariant ProductsCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.image == image && other.category == category;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ category.hashCode;
}
