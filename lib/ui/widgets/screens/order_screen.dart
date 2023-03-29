import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/icon_text_button.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainColor,
        centerTitle: true,
        title: const Text(
          'Ordering',
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: const Text("Ordering",
          //       style: TextStyle(color: Utils.mainDark, fontSize: 30)),
          // ),
          Expanded(
            child: Consumer<OrderPageSelectionService>(
              builder: (context, pss, child) {
                return PageView(
                  onPageChanged: (index) => pss.setPageIndex(index),
                  controller: pss.pageController,
                  children: [
                    const PersonalInfoPage(),
                    const AddressInfoPage(),
                  ],
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.all(10),
          //     child: Row(
          //       children: [],
          //     )),
        ],
      ),
    );
  }
}

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controlleerEmail = TextEditingController();
    var _controlleerFirstName = TextEditingController();
    var _controlleerLastName = TextEditingController();
    var _controlleerPhoneNumber = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Enter personal information",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              OrderTextField(
                placeholder: "Email",
                controller: _controlleerEmail,
              ),
              OrderTextField(
                placeholder: "Имя",
                controller: _controlleerFirstName,
              ),
              OrderTextField(
                placeholder: "Фамилия",
                controller: _controlleerLastName,
              ),
              OrderTextField(
                placeholder: "Номер телефона",
                controller: _controlleerPhoneNumber,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    IconTextButton(
                        disable: false,
                        text: "Next",
                        onTap: () {
                          var email = _controlleerEmail.text;
                          var firstName = _controlleerFirstName.text;
                          var lastName = _controlleerLastName.text;
                          var phoneNumber = _controlleerPhoneNumber.text;

                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Email'),
                            ));
                          } else if (firstName.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Имя'),
                            ));
                          } else if (lastName.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Фамилия'),
                            ));
                          } else if (phoneNumber.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Номер телефона'),
                            ));
                          } else {
                            context.read<OrderService>().setPersonalInfo(
                                email, firstName, lastName, phoneNumber);

                            context
                                .read<OrderPageSelectionService>()
                                .setPageIndex(1);
                          }
                        }),
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

class AddressInfoPage extends StatelessWidget {
  const AddressInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controlleerStreet = TextEditingController();
    var _controlleerHouse = TextEditingController();
    var _controlleerHousing = TextEditingController();
    var _controlleerEntrance = TextEditingController();
    var _controlleerApartament = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Enter shipping address",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              OrderTextField(
                placeholder: "street",
                controller: _controlleerStreet,
              ),
              OrderTextField(
                placeholder: "house",
                controller: _controlleerHouse,
              ),
              OrderTextField(
                placeholder: "housing",
                controller: _controlleerHousing,
              ),
              OrderTextField(
                placeholder: "entrance",
                controller: _controlleerEntrance,
              ),
              OrderTextField(
                placeholder: "apartament",
                controller: _controlleerApartament,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextButton(
                        disable: false,
                        text: "Back",
                        onTap: () => context
                            .read<OrderPageSelectionService>()
                            .setPageIndex(0)),
                    IconTextButton(
                        disable: false,
                        text: "Next",
                        onTap: () {
                          var street = _controlleerStreet.text;
                          var house = _controlleerHouse.text;
                          var housing = _controlleerHousing.text;
                          var entrance = _controlleerEntrance.text;
                          var apartament = _controlleerApartament.text;

                          if (street.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Улица'),
                            ));
                          } else if (house.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Номер дома'),
                            ));
                          } else if (housing.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Корпус'),
                            ));
                          } else if (entrance.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Номер Подезда'),
                            ));
                          } else if (apartament.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Номер квартиры'),
                            ));
                          } else {
                            context.read<OrderService>().setAddressInfo(
                                  street,
                                  house,
                                  housing,
                                  entrance,
                                  apartament,
                                );
                          }
                          context
                              .read<OrderPageSelectionService>()
                              .setPageIndex(1);
                        }),
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

class OrderTextField extends StatelessWidget {
  OrderTextField(
      {Key? key, required this.placeholder, required this.controller})
      : super(key: key);

  String placeholder;
  TextEditingController controller;

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
