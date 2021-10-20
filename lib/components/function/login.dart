import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/screens/authentication/login_screen.dart';
import 'package:bokshaul_haulier/screens/logged/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(
    BuildContext context, String username, String password) async {
  Uri url = Uri.parse(baseUrl + '/login');

  final response =
      await http.post(url, body: {'username': username, 'password': password});

  if (response.statusCode == 201) {
    final jsonResponse = jsonDecode(response.body);
    SharedPreferences _preference = await SharedPreferences.getInstance();
    _preference.setBool("isLoggedIn", true);
    _preference.setString("userId", jsonResponse['data']['id'].toString());
    fixedTo(
        context,
        const Index(
          index: 0,
        ));
  } else {
    displayResponse(context, Colors.red, "Username atau Password salah.");
  }
}

Future<void> logout(BuildContext context) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  fixedTo(context, const LoginScreen());
  _sharedPreferences.clear();
}

void checkLogin(BuildContext context) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  bool isLogin = _sharedPreferences.getBool("isLoggedIn") ?? false;
  isLogin
      ? fixedTo(context, const Index(index: 0))
      : fixedTo(context, const LoginScreen());
}
