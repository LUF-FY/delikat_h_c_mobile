import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/icon_text_button.dart';
import 'package:delikat_h_c_mobile/ui/widgets/order_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressInfoPage extends StatelessWidget {
  const AddressInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controlleerStreet = TextEditingController();
    var controlleerHouse = TextEditingController();
    var controlleerHousing = TextEditingController();
    var controlleerEntrance = TextEditingController();
    var controlleerApartament = TextEditingController();

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
                controller: controlleerStreet,
              ),
              OrderTextField(
                placeholder: "Номер дома",
                controller: controlleerHouse,
              ),
              OrderTextField(
                placeholder: "Корпус",
                controller: controlleerHousing,
              ),
              OrderTextField(
                placeholder: "Номер подезда",
                controller: controlleerEntrance,
              ),
              OrderTextField(
                placeholder: "Номер квартиры",
                controller: controlleerApartament,
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
                          var street = controlleerStreet.text;
                          var house = controlleerHouse.text;
                          var housing = controlleerHousing.text;
                          var entrance = controlleerEntrance.text;
                          var apartament = controlleerApartament.text;

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
                                  .setPageIndex(2);
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
