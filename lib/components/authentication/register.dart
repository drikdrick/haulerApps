import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void registerAccount(BuildContext context, String company, String phone,
    String email, String password, String rePassword) {
  if (!EmailValidator.validate(email)) {
    displayResponse(context, Colors.red, "Format email salah.");
    return;
  }
  if (password != rePassword) {
    displayResponse(context, Colors.red, "Kedua password harus sama.");
    return;
  }
}
