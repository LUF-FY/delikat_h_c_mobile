import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

class Goods {
  Product product;
  int quantity;

  Goods({
    required this.product,
    required this.quantity,
  });

  Goods CopyWith({Product? product, int? quantity}) {
    return Goods(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'Goods(product: ${product.toString()},\n quantity: $quantity)';
  }
}
