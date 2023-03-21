import 'package:delikat_h_c_mobile/domain/entity/goods.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';

final List<Product> ProductData = [
  Product(
    id: 1,
    name: 'Эрик будущий депутат',
    price: 0,
    image: '/images/products/wolf.png',
    description: 'Любит тяночек',
  ),
  Product(
    id: 2,
    name: 'OLINA',
    price: 6,
    image: '/images/products/wolf.png',
    description:
        ',Хочет пони минижирафа самоеда корги много денег дом квартиру машину еще машину и еще дом и еще квартиру и поездить по миру но ничего не делатьа почему а потому что ВОВА КУПИ',
  ),
];

final List<Goods> GoodsData = [
  Goods(
    product: ProductData[0],
    quantity: 12,
  ),
  Goods(
    product: ProductData[1],
    quantity: 2,
  ),
];
