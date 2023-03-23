import 'package:auto_size_text/auto_size_text.dart';
import 'package:delikat_h_c_mobile/domain/entity/cart_item.dart';
import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCatalogWidget extends StatelessWidget {
  ProductCatalogWidget({
    Key? key,
    required this.catrItem,
  }) : super(key: key);

  CartItem catrItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(catrItem.toString());
      },
      child: SizedBox(
        height: 250,
        child: Card(
          elevation: 2,
          shadowColor: Colors.green,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductImageWidget(img: catrItem.product.image),
              ),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Divider(height: 6),
                    SizedBox(
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: ProductNameWidget(name: catrItem.product.name),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ProductPriceWidget(price: catrItem.product.price),
                          ),
                        ),
                        //ProductCardButtons(quantity: goods.quantity),
                        ProductCardBuyButton(cartItem: ),
                      ],
                    )
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
      '${price}₽',
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
    required this.cartItem
  }) : super(key: key);

  int quantity;
  CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ProductCardQuantityChangeButton(
            text: '-',
            cartItem: cartItem,
          ),
          SizedBox(
            width: 40,
            child: Center(child: Text('$quantity')),
          ),
          ProductCardQuantityChangeButton(
            text: '+',
            cartItem: cartItem,
          ),
        ],
      ),
    );
  }
}

class ProductCardQuantityChangeButton extends StatelessWidget {
  ProductCardQuantityChangeButton({super.key, required this.text, required this.cartItem});
  String text;
  CartItem cartItem;

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
        onPressed: () {
          if(text == '+'){
            context.read<ShoppingCartService>().incItemQuantity(cartItem: cartItem);
          }
          else if (text == '-'){
            context.read<ShoppingCartService>().decItemQuantity(cartItem: cartItem);
          }
        },
      ),
    );
  }
}

class ProductCardBuyButton extends StatelessWidget {
  const ProductCardBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
      child: const Text(
        "Buy",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onPressed: () {},
    );
  }
}
