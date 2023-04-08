import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
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
                        child: ProductNameWidget(name: cartItem.product.name),
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

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image(
        image: NetworkImage('http://www.plus-pumba.ru/storage$img'),
      ),
    );
  }
}

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({Key? key, required this.price}) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price₽',
      style: const TextStyle(
        color: Utils.mainColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
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

// class ProductCardBuyButton extends StatelessWidget {
//   const ProductCardBuyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style:
//           ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
//       // child: const Icon(
//       //   Icons.add_shopping_cart,
//       //   size: 20,
//       //   color: Colors.white,
//       // ),
//       child: const Text(
//         "Buy",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//       onPressed: () {},
//     );
//   }
// }

// class ProductCardQuantityChangeButton extends StatelessWidget {
//   ProductCardQuantityChangeButton({super.key, required this.text});
//   String text;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40.0,
//       child: ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStatePropertyAll(Colors.green),
//         ),
//         // maximumSize: MaterialStatePropertyAll(Size(18.0, 18.0))),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

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
