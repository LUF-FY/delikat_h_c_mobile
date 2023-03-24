import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ProductListView(),
    );
  }
}

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final catrItemsList =
        context.select((ShoppingCartService scs) => scs.cartProducts);

    return ListView.builder(
      itemCount: catrItemsList.length,
      itemBuilder: (context, index) {
        return ProductCartWidget(
          cartItem: catrItemsList[index],
        );
      },
    );
  }
}
