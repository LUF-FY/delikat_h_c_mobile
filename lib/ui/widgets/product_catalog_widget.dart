import 'package:delikat_h_c_mobile/domain/entity/product_class.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_price_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_Image_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_card_widgets/product_name_widget.dart';
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
        print(product.toString());
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
                child: ProductImageWidget(img: product.image),
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
                          child: ProductNameWidget(
                            name: product.name,
                            fontSize: 15,
                          ),
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
                            child: ProductPriceWidget(price: product.price),
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

class ProductCardBuyButton extends StatelessWidget {
  const ProductCardBuyButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var cartSevice = context.watch<ShoppingCartService>();

    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              cartSevice.isProductInCart(product)
                  ? Utils.buttonDisableBG
                  : Utils.mainColor)),
      onPressed: cartSevice.isProductInCart(product)
          ? null
          : () {
              cartSevice.addToCart(product);
            },
      child: Text(
        "Купить",
        style: TextStyle(
          color: cartSevice.isProductInCart(product)
              ? Utils.buttonDisableT
              : Utils.buttonEnableT,
          fontSize: 16,
        ),
      ),
    );
  }
}
