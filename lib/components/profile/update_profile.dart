import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/screens/logged/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> editProfile(BuildContext context, String company, String phone,
    String email, String username) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId");
  Map data = {
    "id_trucker": userId,
    "company": company,
    "phone": phone,
    "email": email,
    "username": username,
  };
  Uri url = Uri.parse(baseUrl + "/updateprofil");
  final response = await http.post(url, body: data);
  if (response.statusCode == 201) {
    fixedTo(context, const Index(index: 2));
    displayResponse(context, Colors.green, "Profile berhasil diperbaharaui");
  } else {
    displayResponse(context, Colors.red, "Profile gagal diperbaharui");
  }
}

Future<void> editPassword(BuildContext context, String oldPassword,
    String newPassword, String rePassword) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse(baseUrl + "/profil/resetpassword");
  var userId = _preferences.getString("userId");
  Map data = {
    "id_customer": userId,
    "old_password": oldPassword,
    "password": newPassword,
    "repassword": rePassword,
  };

  final response = await http.post(url, body: data);
  final jsonResponse = jsonDecode(response.body);
  if (jsonResponse["success"]) {
    fixedTo(context, const Index(index: 2));
    displayResponse(context, Colors.green, "Password berhasil diperbaharui");
  } else {
    displayResponse(context, Colors.red, jsonResponse["message"]);
  }
}
