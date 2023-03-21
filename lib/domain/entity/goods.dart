import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

class Goods {
  final Product product;
  int quantity;

  Goods({
    required this.product,
    required this.quantity,
  });

  @override
  String toString() {
    return 'Goods(product: ${product.toString()},\n quantity: $quantity)';
  }
}
