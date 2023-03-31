import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';

class OrderProduct {
  int? id;
  int? quantity;

  OrderProduct({required this.id, required this.quantity});

  OrderProduct.fromCartitem(CartItem ci) {
    id = ci.product.id;
    quantity = ci.quantity;
  }

  static OrderProduct fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json['product_id'] as int,
        quantity: json['quantity'] as int,
      );

  static Map<String, dynamic> toJson(OrderProduct instance) =>
      <String, dynamic>{
        'product_id': instance.id,
        'quantity': instance.quantity,
      };

  @override
  String toString() {
    return 'OrderProduct(product_id: $id,\n quantity: $quantity)';
  }
}
