import 'package:flutter/material.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.check_circle_outline,
          color: Colors.grey,
          size: 100,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Ваш заказ принят\nОжидайте подтверждения от оператора",
          style: TextStyle(color: Colors.grey, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
