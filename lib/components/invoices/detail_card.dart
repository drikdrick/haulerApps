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
  if (description == '1' || description == '4' || description == 'inbound' ) {
    description = 'Inbound/Import';
  }else if (description == '2' || description == '3' || description == 'outbound' ) {
    description = 'Outbound/Eksport';
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(info, style: const TextStyle(fontWeight: FontWeight.bold)),
      Flexible(
        child: Text(
          description,
          textAlign: TextAlign.end,
          overflow: TextOverflow.clip,
        ),
      ),
    ],
  );
}
