class OrderProduct {
  final int id;
  final int quantity;

  OrderProduct({required this.id, required this.quantity});

  static OrderProduct fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json['id'] as int,
        quantity: json['quantity'] as int,
      );

  Map<String, dynamic> toJson(OrderProduct instance) => <String, dynamic>{
        'id': instance.id,
        'quantity': instance.quantity,
      };

  @override
  String toString() {
    return 'OrderProduct(id: $id,\n quantity: $quantity)';
  }
}
