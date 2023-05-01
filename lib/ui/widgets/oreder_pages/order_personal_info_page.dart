import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/extentions.dart';
import 'package:delikat_h_c_mobile/order_text_field_validators.dart';
import 'package:delikat_h_c_mobile/ui/widgets/icon_text_button.dart';
import 'package:delikat_h_c_mobile/ui/widgets/order_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controlleerEmail = TextEditingController();
    var controlleerFirstName = TextEditingController();
    var controlleerLastName = TextEditingController();
    var controlleerPhoneNumber = TextEditingController();

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
                placeholder: "Имя",
                controller: controlleerFirstName,
              ),
              OrderTextField(
                placeholder: "Фамилия",
                controller: controlleerLastName,
              ),
              OrderTextField(
                placeholder: "Электронная почта",
                controller: controlleerEmail,
              ),
              OrderTextField(
                  placeholder: "Номер телефона",
                  controller: controlleerPhoneNumber),
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
                          var firstName = controlleerFirstName.text.trim();
                          var lastName = controlleerLastName.text.trim();
                          var phoneNumber = controlleerPhoneNumber.text.trim();
                          var email = controlleerEmail.text.trim();

                          if (PhoneValidator.validate(phoneNumber, context) &&
                              MyEmailValidator.validate(email, context) &&
                              TextValidator.validate(
                                  firstName, 'Заполните поле Имя', context) &&
                              TextValidator.validate(lastName,
                                  'Заполните поле Фамилия', context)) {
                            context.read<OrderService>().setPersonalInfo(
                                email,
                                firstName.capitalize(),
                                lastName.capitalize(),
                                phoneNumber);

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
