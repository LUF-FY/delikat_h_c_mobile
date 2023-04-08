import 'package:flutter/material.dart';

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget(
      {Key? key, required this.name, required this.fontSize})
      : super(key: key);

  final String name;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
