import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:flutter/material.dart';

Widget profileTile(BuildContext context, IconData icon, String title, tujuan) {
  return ListTile(
    leading: Icon(icon),
    trailing: const Icon(Icons.chevron_right_sharp),
    title: Text(title),
    onTap: () => navigateTo(context, tujuan),
  );
}

Widget logoutTile(BuildContext context, IconData icon, String title, tujuan) {
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
    onTap: () => fixedTo(context, tujuan),
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
