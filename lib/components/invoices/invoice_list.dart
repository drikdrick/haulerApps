import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

import 'detail_card.dart';

Widget paidTile(String import, String dateTime, String slName, String voyageNum,
    String driverName, String police, String total) {
  return Card(
    shadowColor: Colors.blue,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                import,
                style: kHeadlineSmall.copyWith(fontSize: 12),
              ),
              Text(
                dateTime,
                style: kBodySmall.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
          const Divider(),
          detailInfoCard("Shipping Line", slName),
          const Divider(),
          detailInfoCard("Voyage Number", voyageNum),
          const Divider(),
          detailInfoCard("Driver Name", driverName),
          const Divider(),
          detailInfoCard("No. Polisi", police),
          const Divider(),
          detailCard("Total", total),
        ],
      ),
    ),
  );
}

Widget unpaidTile(String import, String dueDate, String dateTime, String slName,
    String voyageNum, String driverName, String police, String total) {
  return Card(
    shadowColor: Colors.blue,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                import,
                style: kHeadlineSmall.copyWith(fontSize: 12),
              ),
              Text(
                dateTime,
                style: kBodySmall.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
          const Divider(),
          detailInfoCard("Shipping Line", slName),
          const Divider(),
          detailInfoCard("Voyage Number", voyageNum),
          const Divider(),
          detailInfoCard("Driver Name", driverName),
          const Divider(),
          detailInfoCard("No. Polisi", police),
          const Divider(),
          detailCard("Total", total),
          const Divider(),
          Text(
            "*bayar sebelum "+dueDate.split(" ")[0],
            style: kHeadlineSmall.copyWith(
              color: Colors.red,
              fontSize: 12,
            ),
          )
        ],
      ),
    ),
  );
}
