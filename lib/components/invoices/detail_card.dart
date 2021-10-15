import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

Widget detailCard(String process, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(process, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(
        "Rp" + price,
        style: kHeadlineSmall.copyWith(
          color: Colors.blue,
          fontSize: 12,
        ),
      ),
    ],
  );
}

Widget detailInfoCard(String info, String description) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(info, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(description),
    ],
  );
}
