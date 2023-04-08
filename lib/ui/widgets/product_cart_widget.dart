import 'package:cached_network_image/cached_network_image.dart';
import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_price_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_Image_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_name_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: GestureDetector(
        // onTap: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return ProductDetail(
        //       product: _product,
        //     );
        //   }));
        // },
        onTap: () {
          print(cartItem.toString());
        },

        child: Card(
          elevation: 2,
          shadowColor: Colors.green,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8.0),
                child: ProductImageWidget(
                  img: cartItem.product.image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        child: ProductNameWidget(
                          name: cartItem.product.name,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child:
                            ProductPriceWidget(price: cartItem.product.price),
                      ),
                      ProductCardButtons(cartItem: cartItem),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ProductCardButtonDelete(cartItem: cartItem),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardButtonDelete extends StatelessWidget {
  const ProductCardButtonDelete({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context
            .read<ShoppingCartService>()
            .removeFromCart(cartItem: cartItem),
        icon: const Icon(
          Icons.delete_forever,
          color: Utils.mainColor,
        ));
  }
}

class ProductCardButtons extends StatelessWidget {
  const ProductCardButtons({Key? key, required this.cartItem})
      : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ProductCardQuantityChangeButton(
          text: '-',
          cartItem: cartItem,
        ),
        SizedBox(
          width: 40,
          child: Center(child: Text('${cartItem.quantity}')),
        ),
        ProductCardQuantityChangeButton(
          text: '+',
          cartItem: cartItem,
        ),
      ],
    );
  }
}

class ProductCardQuantityChangeButton extends StatelessWidget {
  const ProductCardQuantityChangeButton(
      {super.key, required this.text, required this.cartItem});
  final String text;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Utils.mainColor),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Utils.mainTextColor,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          if (text == '+') {
            context
                .read<ShoppingCartService>()
                .incItemQuantity(cartItem: cartItem);
          } else if (text == '-') {
            context
                .read<ShoppingCartService>()
                .decItemQuantity(cartItem: cartItem);
          }
        },
      ),
    );
  }
}
