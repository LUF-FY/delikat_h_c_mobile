import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

final List<Product> productData = [
  Product(
    id: 1,
    name: 'Эрик будущий депутат',
    price: 0,
    image: '',
    description: 'Любит тяночек',
  ),
  Product(
    id: 2,
    name: 'OLINA',
    price: 6,
    image: '',
    description:
        ',Хочет пони минижирафа самоеда корги много денег дом квартиру машину еще машину и еще дом и еще квартиру и поездить по миру но ничего не делатьа почему а потому что ВОВА КУПИ',
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
