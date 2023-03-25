import 'package:delikat_h_c_mobile/data.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_cart_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductListView();
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
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',
                              style: TextStyle(color: Utils.mainDark)),
                          Text('₽${cartSevice.getTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Utils.mainDark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ],
                      ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    color: cartSevice.cartProducts.isEmpty
                        ? Utils.buttonDisableBG
                        : Utils.mainColor.withOpacity(0.2),
                    child: InkWell(
                      splashColor: Utils.mainDark.withOpacity(0.2),
                      highlightColor: Utils.mainDark.withOpacity(0.5),
                      onTap: cartSevice.cartProducts.isEmpty
                          ? null
                          : () {
                              cartSevice.clearCart();
                            },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_forever,
                              color: cartSevice.cartProducts.isEmpty
                                  ? Utils.buttonDisableT
                                  : Utils.mainDark,
                            ),
                            Text(
                              'Clear Cart',
                              style: TextStyle(
                                  color: cartSevice.cartProducts.isEmpty
                                      ? Utils.buttonDisableT
                                      : Utils.mainDark),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
