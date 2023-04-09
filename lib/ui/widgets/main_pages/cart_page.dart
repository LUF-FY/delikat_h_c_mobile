import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/icon_text_button.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_cart_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductListView();
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartSevice = context.watch<ShoppingCartService>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartSevice.cartProducts.length,
              itemBuilder: (context, index) {
                return ProductCartWidget(
                  cartItem: cartSevice.cartProducts[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                cartSevice.cartProducts.isEmpty
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Итого:',
                              style: TextStyle(color: Utils.mainDark)),
                          Text('${cartSevice.getTotal().toStringAsFixed(2)} ₽',
                              style: const TextStyle(
                                  color: Utils.mainDark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ],
                      ),
                IconTextButton(
                  disable: cartSevice.cartProducts.isEmpty,
                  text: "Заказать",
                  onTap: () {
                    context
                        .read<OrderService>()
                        .setOrderProducts(cartSevice.cartProducts);
                    Navigator.of(context).pushNamed('/order');
                  },
                  //
                  iconData: Icons.shopping_cart_checkout,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
