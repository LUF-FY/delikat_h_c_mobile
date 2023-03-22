import 'package:delikat_h_c_mobile/domain/data_providers/product_data_provider.dart';
import 'package:delikat_h_c_mobile/domain/entity/goods.dart';

class GoodsRepository {
  final productDataProvider = ProductDataProvider();

  Future<List<Goods>> initialize() async {
    var products = await productDataProvider.featchProducts();

    List<Goods> goods = [];
    for (var product in products) {
      var g = Goods(product: product, quantity: 0);
      print(g.toString());
      goods.add(g);
    }
    return goods;
  }
}
