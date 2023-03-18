import 'package:delikat_h_c_mobile/domain/data_providers/product_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/goods.dart';

class GoodsRepository {
  final productDataProvider = ProductDataProvider();
  var goods = <Goods>[];

  Future<void> initialize() async {
    await productDataProvider.featchProducts();

    goods = <Goods>[];
    for (var product in productDataProvider.products) {
      goods.add(Goods(product: product, quantity: 0));
    }
  }
}
