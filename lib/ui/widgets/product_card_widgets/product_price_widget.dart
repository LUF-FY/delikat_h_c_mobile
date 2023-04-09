import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({Key? key, required this.price}) : super(key: key);

  final num price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price.toStringAsFixed(2)} ₽',
      style: const TextStyle(
        color: Utils.mainColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
