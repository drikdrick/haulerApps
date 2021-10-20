import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

Widget statusOrder() {
  return SizedBox(
    height: 50,
    child: ListTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
      ),
      leading: const Icon(
        Icons.library_add_check_rounded,
        color: Colors.blueGrey,
      ),
      title: Text("Lorem Ipsum dolor sit amet alapus ", style: kHeadlineSmall),
      subtitle: const Text("Tanggal dan waktu"),
      dense: true,
    ),
  );
}
