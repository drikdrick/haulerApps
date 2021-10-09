import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

Widget displayOrder(
  Color color,
  String portName,
  String houseName,
  String gkOrder,
  String type,
  String status,
) {
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    shadowColor: Colors.blue,
    elevation: 5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: color,
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  portName,
                  style: kHeadline.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
                Text(
                  houseName,
                  style: kHeadline.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID#",
                    style: kHeadlineSmall,
                  ),
                  Text(
                    "Order Type",
                    style: kHeadlineSmall,
                  ),
                  Text(
                    "Status",
                    style: kHeadlineSmall,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    gkOrder,
                    style: kBodySmall,
                  ),
                  Text(
                    type,
                    style: kBodySmall,
                  ),
                  Text(
                    status,
                    style: kBodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
