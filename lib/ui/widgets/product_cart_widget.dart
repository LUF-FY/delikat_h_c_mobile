import 'package:auto_size_text/auto_size_text.dart';
import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:flutter/material.dart';

class ProductCartWidget extends StatelessWidget {
  ProductCartWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 100,
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
                height: 84,
                width: 84,
                padding: const EdgeInsets.all(8.0),
                child: ProductImageWidget(img: cartItem.product.image),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    const Divider(height: 6),
                    SizedBox(
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: ProductNameWidget(name: cartItem.product.name),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 24,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ProductPriceWidget(
                                price: cartItem.product.price),
                          ),
                        ),
                        ProductCardButtons(quantity: cartItem.quantity),
                      ],
                    ),
                  ],
                ),
              ),
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
    return Container(
      //child: Hero(
      //tag: img,
      //child: Image.asset('assets/$img.png'),
      child: Image(
        image: NetworkImage('http://www.plus-pumba.ru/storage$img'),
      ),
      //),
    );
  }
}

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      name,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
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
        color: Colors.green,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ProductCardButtons extends StatelessWidget {
  ProductCardButtons({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  int quantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ProductCardQuantityChangeButton(
            text: '-',
          ),
          SizedBox(
            width: 40,
            child: Center(child: Text('$quantity')),
          ),
          ProductCardQuantityChangeButton(
            text: '+',
          ),
        ],
      ),
    );
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

class ProductCardQuantityChangeButton extends StatelessWidget {
  ProductCardQuantityChangeButton({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green),
        ),
        // maximumSize: MaterialStatePropertyAll(Size(18.0, 18.0))),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
