import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCardBuyButton extends StatelessWidget {
  ProductCardBuyButton({super.key, required this.product});

  final Product product;
  final height = 40.0;

  @override
  Widget build(BuildContext context) {
    var cartSevice = context.watch<ShoppingCartService>();

    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height),
          )),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, height)),
          backgroundColor: MaterialStatePropertyAll(
              cartSevice.isProductInCart(product)
                  ? Utils.buttonDisableBG
                  : Utils.mainGreen)),
      onPressed: cartSevice.isProductInCart(product)
          ? () {
              cartSevice
                  .removeFromCart(CartItem(product: product, quantity: 0));
            }
          : () {
              cartSevice.addToCart(product, context);
            },
      child: cartSevice.isProductInCart(product)
          ? const Text(
              "Удалить",
              style: TextStyle(
                color: Utils.buttonCancelT,
                fontSize: 16,
              ),
            )
          : const Text(
              "В корзину",
              style: TextStyle(
                color: Utils.buttonEnableT,
                fontSize: 16,
              ),
            ),
    );
  }
}
