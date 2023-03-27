import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: const Text("Ordering",
                style: TextStyle(color: Utils.mainDark, fontSize: 30)),
          ),
          Expanded(
            child: Consumer<OrderPageSelectionService>(
              builder: (context, pss, child) {
                return PageView(
                  onPageChanged: (index) => pss.setPageIndex(index),
                  controller: pss.pageController,
                  children: [PersonalInfoPage(), AddressInfoPage()],
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [],
              )),
        ],
      ),
    );
  }
}

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text("Enter personal information",
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            OrderTextField(placeholder: "Email"),
            OrderTextField(placeholder: "Firstname"),
            OrderTextField(placeholder: "Lastname"),
            OrderTextField(placeholder: "Phone number"),
          ],
        ),
      ),
    );
  }
}

class AddressInfoPage extends StatelessWidget {
  const AddressInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text("Enter shipping address",
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            OrderTextField(placeholder: "street"),
            OrderTextField(placeholder: "house"),
            OrderTextField(placeholder: "housing"),
            OrderTextField(placeholder: "entrance"),
            OrderTextField(placeholder: "orderProducts"),
          ],
        ),
      ),
    );
  }
}

class OrderTextField extends StatelessWidget {
  OrderTextField({Key? key, required this.placeholder}) : super(key: key);

  String placeholder;

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
                contentPadding:
                    EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                hintText: placeholder),
            style: const TextStyle(fontSize: 16),
            //controller: usernameController,
          )),
    );
  }
}
