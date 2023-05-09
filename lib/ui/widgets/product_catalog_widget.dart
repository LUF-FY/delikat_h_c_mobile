import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_buy_button_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_price_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/Image_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_name_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/screens/product_description_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCatalogWidget extends StatelessWidget {
  const ProductCatalogWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDescriptionScreen(product: product)));
      },
      child: Container(
        height: 260,
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
                child: ImageWidget(img: product.image),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(height: 6),
                    SizedBox(
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: ProductNameWidget(
                            name: product.name,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ProductPriceWidget(
                              price: product.price,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ProductCardBuyButton(
                          product: product,
                        ),
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
