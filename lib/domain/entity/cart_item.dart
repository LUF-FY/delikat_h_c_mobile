import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem CopyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'CartItem(product: ${product.toString()},\n quantity: $quantity)';
  }
}
