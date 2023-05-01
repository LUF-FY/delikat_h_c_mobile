import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class PhoneValidator {
  static bool validate(String phoneNumber, BuildContext context) {
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Заполните поле Номер телефона'),
        ),
      );
      return false;
    }

    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = new RegExp(regexPattern);

    if (!regExp.hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Неправильный фомат номера телефона'),
      ));
      return false;
    }
    return true;
  }
}

class MyEmailValidator {
  static bool validate(String email, BuildContext context) {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Заполните поле Электронная почта'),
      ));
      return false;
    } else if (!EmailValidator.validate(email)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Неправильный фомат электронной почты'),
      ));
      return false;
    }
    return true;
  }
}

class TextValidator {
  static bool validate(
      String text, String emptyErrorMassage, BuildContext context) {
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(emptyErrorMassage),
      ));
      return false;
    }
    return true;
  }
}

class NumValidator {
  static bool validate(String num, String emptyErrorMassage,
      String formatErrorMassa, BuildContext context) {
    if (num.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(emptyErrorMassage),
      ));
      return false;
    } else if (int.tryParse(num) == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(formatErrorMassa),
      ));
      return false;
    }
    return true;
  }
}
