import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

final List<Product> productData = [
  Product(
    id: 1,
    name: 'Мыло',
    price: 135.00,
    image: '',
    description: '',
  ),
  Product(
    id: 2,
    name: 'Зубная паста',
    price: 299.90,
    image: '',
    description: '',
  ),
];

final List<CartItem> cartItemData = [
  CartItem(
    product: productData[0],
    quantity: 12,
  ),
  CartItem(
    product: productData[1],
    quantity: 2,
  ),
];
