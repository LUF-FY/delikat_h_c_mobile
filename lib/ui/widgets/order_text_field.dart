import 'package:flutter/material.dart';

class OrderTextField extends StatelessWidget {
  const OrderTextField(
      {Key? key, required this.placeholder, required this.controller})
      : super(key: key);

  final String placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextField(
            onChanged: (text) {},
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 20, bottom: 11, top: 11, right: 15),
                hintText: placeholder),
            style: const TextStyle(fontSize: 16),
            controller: controller,
          )),
    );
  }
}
