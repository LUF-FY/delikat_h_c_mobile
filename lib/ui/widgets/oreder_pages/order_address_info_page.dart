import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/extentions.dart';
import 'package:delikat_h_c_mobile/order_text_field_validators.dart';
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
                          var street = controlleerStreet.text.trim();
                          var house = controlleerHouse.text.trim();
                          var housing = controlleerHousing.text
                              .trim(); // Возможно может присутствовать бука в номере
                          var entrance = controlleerEntrance.text.trim();
                          var apartment = controlleerApartament.text.trim();

                          if (TextValidator.validate(
                                  street, 'Заполните поле Улица', context) &&
                              NumValidator.validate(
                                  house,
                                  'Заполните поле Номер дома',
                                  'Поле Номер дома должно состоять из цифр',
                                  context) &&
                              NumValidator.validate(
                                  housing,
                                  'Заполните поле Корпус',
                                  'Поле Корпус должно состоять из цифр',
                                  context) &&
                              NumValidator.validate(
                                  entrance,
                                  'Заполните поле Номер подезда',
                                  'Поле Номер подезда должно состоять из цифр',
                                  context) &&
                              NumValidator.validate(
                                  apartment,
                                  'Заполните поле Номер квартиры',
                                  'Поле Номер квартиры должно состоять из цифр',
                                  context)) {
                            var massage = context
                                .read<OrderService>()
                                .setAddressInfo(street.capitalize(), house,
                                    housing, entrance, apartment);

                            if (massage != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('Неправильно заполнено поле $massage'),
                              ));
                            } else {
                              context.read<OrderService>().sendOrder();
                              context.read<ShoppingCartService>().clearCart();
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
