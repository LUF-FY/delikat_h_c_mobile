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
          'Оформление заказа',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
                child: Text("Введите персональную информацию",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              OrderTextField(
                placeholder: "Электронная почта",
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    IconTextButton(
                        disable: false,
                        text: "Далее",
                        onTap: () {
                          // _controlleerEmail.text = "jojo@list.ru";
                          // _controlleerFirstName.text = "Jorno";
                          // _controlleerLastName.text = "Jovana";
                          // _controlleerPhoneNumber.text = "89991345678";

                          var email = _controlleerEmail.text;
                          var firstName = _controlleerFirstName.text;
                          var lastName = _controlleerLastName.text;
                          var phoneNumber = _controlleerPhoneNumber.text;

                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Электронная почта'),
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
    var _controlleerApartment = TextEditingController();

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
                child: Text("Введите адрес доставки",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              OrderTextField(
                placeholder: "Улица",
                controller: _controlleerStreet,
              ),
              OrderTextField(
                placeholder: "Номер дома",
                controller: _controlleerHouse,
              ),
              OrderTextField(
                placeholder: "Корпус",
                controller: _controlleerHousing,
              ),
              OrderTextField(
                placeholder: "Номер подезда",
                controller: _controlleerEntrance,
              ),
              OrderTextField(
                placeholder: "Номер квартиры",
                controller: _controlleerApartment,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconTextButton(
                        disable: false,
                        text: "Назад",
                        onTap: () => context
                            .read<OrderPageSelectionService>()
                            .setPageIndex(0)),
                    IconTextButton(
                        disable: false,
                        text: "Подтвердить",
                        onTap: () {
                          // _controlleerStreet.text = "Мира";
                          // _controlleerHouse.text = "1";
                          // _controlleerHousing.text = "2";
                          // _controlleerEntrance.text = "3";
                          // _controlleerApartment.text = "4";

                          var street = _controlleerStreet.text;
                          var house = _controlleerHouse.text;
                          var housing = _controlleerHousing.text;
                          var entrance = _controlleerEntrance.text;
                          var apartament = _controlleerApartment.text;

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
                              content: Text('Заполните поле Номер подезда'),
                            ));
                          } else if (apartament.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Заполните поле Номер квартиры'),
                            ));
                          } else {
                            var massage = context
                                .read<OrderService>()
                                .setAddressInfo(street, house, housing,
                                    entrance, apartament);
                            if (massage != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('Неправильно заполнено поле $massage'),
                              ));
                            } else {
                              context.read<OrderService>().sendOrder();
                              context
                                  .read<OrderPageSelectionService>()
                                  .setPageIndex(1);
                              print("OK");
                            }
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
