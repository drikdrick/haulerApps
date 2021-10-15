import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/screens/authentication/login_screen.dart';
import 'package:bokshaul_haulier/screens/authentication/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

Future<void> registerAccount(BuildContext context, String company, String phone,
    String username, String email, String password, String rePassword) async {
  //Email and repassword validation
  if (!EmailValidator.validate(email)) {
    displayResponse(context, Colors.red, "Format email salah.");
    return;
  } else if (password != rePassword) {
    displayResponse(context, Colors.red, "Kedua password harus sama.");
    return;
  }
  Map data = {
    'email': email,
    'username': username,
    'company_name': company,
    'password': password,
    'phone': '+62' + phone,
  };
  Uri url = Uri.parse(base_url + '/register');

  var response = await http.post(url, body: data);
  print(response.statusCode);

  if (response.statusCode == 201) {
    print(response.body);
    fixedTo(context, VerifyOtp(emailUser: email));
  } else {
    if (response.body.contains('company')) {
      displayResponse(context, Colors.red, "Perusahaan sudah terdaftar");
    } else if (response.body.contains("username")) {
      displayResponse(context, Colors.red, "Username sudah terdaftar");
    }
  }
}

Future<void> checkOTP(BuildContext context, String otp) async {
  Uri url = Uri.parse(base_url + '/verifikasi/otp');

  final response = await http.post(url, body: {'otp': otp});
  final jsonResponse = jsonDecode(response.body);
  if (jsonResponse["success"]) {
    fixedTo(context, const LoginScreen());
    displayResponse(context, Colors.green, "Registrasi berhasil. Silahkan masuk.");
  }else{
    displayResponse(context, Colors.red, "Verifikasi gagal. Silahkan coba lagi.");
  }
}

Future<void> resentOTP(BuildContext context, String email) async {
  Uri url = Uri.parse(base_url + '/resendotp');

  final response = await http.post(url, body: {'email': email});

  if (response.statusCode == 201) {
    displayResponse(context, Colors.green, "OTP berhasil dikirim");
  } else {
    displayResponse(
        context, Colors.red, "Pengiriman gagal, silahkan coba lagi");
  }
}
