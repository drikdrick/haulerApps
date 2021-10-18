import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/components/function/login.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Widget profileTile(BuildContext context, IconData icon, String title, tujuan) {
  return ListTile(
    leading: Icon(icon),
    trailing: const Icon(Icons.chevron_right_sharp),
    title: Text(title),
    onTap: () => navigateTo(context, tujuan),
  );
}

Widget logoutTile(BuildContext context, IconData icon, String title) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.red,
    ),
    trailing: const Icon(Icons.chevron_right_sharp, color: Colors.red),
    title: Text(
      title,
      style: const TextStyle(color: Colors.red),
    ),
    onTap: () => logout(context),
  );
}

Widget callCenterTile(String title, void callBack, Widget icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(title),
      tileColor: Colors.white,
      onTap: () => callBack,
      leading: icon,
      trailing: const Icon(Icons.arrow_right),
    ),
  );
}

Future<User> fetchUser() async {
  SharedPreferences _preference = await SharedPreferences.getInstance();
  var userId = _preference.getString("userId")!;
  Uri url = Uri.parse(baseUrl + "/dataprofil/" + userId);

  final response = await http.get(url);
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body)["data"][0]);
  } else {
    throw Exception("Failed to load profile");
  }
}
