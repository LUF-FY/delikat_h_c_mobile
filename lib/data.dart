import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

final List<Product> productData = [
  Product(
    id: 1,
    name: 'Эрик будущий депутат',
    price: 0,
    image: 'https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg',
    description: 'Любит тяночек',
  ),
  Product(
    id: 2,
    name: 'OLINA',
    price: 6,
    image:
        'https://drasler.ru/wp-content/uploads/2019/05/%D0%9C%D0%B8%D0%BB%D1%8B%D0%B5-%D0%BD%D0%B5-%D1%80%D0%B0%D1%81%D0%BA%D1%80%D0%B0%D1%88%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BF%D0%BE%D0%B4%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-029.jpg',
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
