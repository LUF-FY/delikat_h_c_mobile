import 'package:cached_network_image/cached_network_image.dart';
import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_price_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/Image_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_name_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/screens/product_description_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDescriptionScreen(product: cartItem.product)));
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
                child: ImageWidget(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductNameWidget(
                        name: cartItem.product.name,
                        fontSize: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ProductPriceWidget(
                          price: cartItem.product.price,
                          fontSize: 18,
                        ),
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
        onPressed: () =>
            context.read<ShoppingCartService>().removeFromCart(cartItem),
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
          // child: ProductCartQuantityTextField(cartItem: cartItem,),
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
                .incItemQuantity(cartItem, context);
          } else if (text == '-') {
            context.read<ShoppingCartService>().decItemQuantity(cartItem);
          }
        },
      ),
    );
  }
}

class ProductCartQuantityTextField extends StatelessWidget {
  const ProductCartQuantityTextField({Key? key, required this.cartItem})
      : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: TextEditingController(),
        onSubmitted: (value) {
          int quantity = int.tryParse(value) ?? 1;
          context
              .read<ShoppingCartService>()
              .changeItemQuantity(cartItem, quantity, context);
        },
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
