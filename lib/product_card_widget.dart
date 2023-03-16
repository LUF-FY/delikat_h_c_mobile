import 'dart:ffi';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:delikat_h_c_mobile/product_class.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late Product _product;

  int _quantity = 1;

  @override
  void initState() {
    _product = widget.product;
    _quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return ProductDetail(
      //       product: _product,
      //     );
      //   }));
      // },
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
            ProductImageWidget(img: _product.img),
            const SizedBox(height: 6),
            ProductNameWidget(name: _product.name),
            const SizedBox(height: 2),
            ProductPriceWidget(price: _product.price),
            const SizedBox(height: 2),
            const Divider(height: 2, color: Colors.grey),
            const SizedBox(height: 10),
            ProductCardButtons(),
          ],
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
    return Hero(
      tag: img,
      child: SizedBox(
        width: 150,
        height: 100,
        child: Image.asset('assets/$img.png'),
      ),
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
      'Rub $price',
      style: const TextStyle(
        color: Colors.green,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ProductCardButtons extends StatelessWidget {
  const ProductCardButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ProductCardBuyButton(),
        Expanded(child: Container()),
        ProductCardQuantityWidget(),
      ],
    );
  }
}

class ProductCardQuantityWidget extends StatefulWidget {
  const ProductCardQuantityWidget({super.key});

  @override
  State<ProductCardQuantityWidget> createState() =>
      _ProductCardQuantityWidgetState();
}

class _ProductCardQuantityWidgetState extends State<ProductCardQuantityWidget> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              quantity = max(1, quantity - 1);
            });
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('$quantity'),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              quantity += 1;
            });
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class ProductCardBuyButton extends StatelessWidget {
  const ProductCardBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.add_shopping_cart,
        size: 20,
        color: Colors.green,
      ),
      label: const Text(
        "Buy",
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
        ),
      ),
    );
  }
}
