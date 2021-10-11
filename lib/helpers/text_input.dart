import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

Widget textInput(
    TextEditingController controller, String label, String hint, Icon icon) {
  return TextFormField(
    controller: controller,
    decoration: textField(hint, label, icon),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return label + " tidak boleh kosong.";
      }
      return null;
    },
  );
}

Widget passwordInput(
    TextEditingController controller, String label, Icon icon) {
  return TextFormField(
    controller: controller,
    obscureText: true,
    decoration: textField("", label, icon),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return label + " tidak boleh kosong.";
      }
      return null;
    },
  );
}

Widget phoneInput(
    TextEditingController controller, String label, String hint, Icon icon) {
  // return IntlPhoneField(
  //   controller: controller,
  //   decoration: textField(hint, label, icon).copyWith(counterText: ""),
  //   initialCountryCode: 'ID',
  //   onChanged: (phone) {
  //     print(phone.completeNumber);
  //     print(controller.text);
  //   },
  //   // countries: ["ID", "SG", "US"],
  //   keyboardType: TextInputType.phone,
  //   iconPosition: IconPosition.trailing,
  // );

  return TextFormField(
    keyboardType: TextInputType.phone,
    controller: controller,
    decoration:
        textField(hint, label, icon).copyWith(prefix: const Text("+62")),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return label + " tidak boleh kosong.";
      } else if (value.length >= 12 || value.length <= 8) {
        return "Format salah. Mohon diperbaiki.";
      }
      return null;
    },
  );
}

InputDecoration textField(String hint, String label, Icon icon) {
  return InputDecoration(
    // hintText: hint,
    labelText: label,
    fillColor: Colors.white,
    filled: true,
    prefixIcon: icon,
  );
}
