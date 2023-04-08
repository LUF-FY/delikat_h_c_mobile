import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

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