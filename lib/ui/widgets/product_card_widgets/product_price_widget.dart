import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget(
      {Key? key, required this.price, required this.fontSize})
      : super(key: key);

  final num price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price.toStringAsFixed(2)} ₽',
      style: TextStyle(
        color: Utils.mainColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
