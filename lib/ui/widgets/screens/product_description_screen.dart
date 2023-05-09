import 'dart:ffi';

import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/ui/widgets/Image_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_buy_button_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_name_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_price_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainGreen,
        centerTitle: true,
        title: const Text(
          'Описание продукта',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ImageWidget(img: product.image),
            ),
            const Divider(height: 10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProductNameWidget(
                          name: product.name,
                          fontSize: 24,
                        ),
                        ProductDescriptionTextWidget(
                          text: product.description,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    Center(
                      child: ProductPriceWidget(
                        price: product.price,
                        fontSize: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ProductCardBuyButton(
                        product: product,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDescriptionTextWidget extends StatelessWidget {
  const ProductDescriptionTextWidget(
      {Key? key, required this.text, required this.fontSize})
      : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal),
    );
  }
}
