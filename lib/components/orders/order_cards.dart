import '../invoices/detail_card.dart';
import '../../helpers/text_style.dart';
import 'package:flutter/material.dart';

Widget displayOrder(
  Color color,
  String portName,
  String houseName,
  String gkOrder,
  String type,
  String status,
  String shippingline,
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
                Expanded(
                  child: Text(
                    portName,
                    style: kHeadline.copyWith(color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
                Expanded(
                  child: Text(
                    houseName,
                    style: kHeadline.copyWith(color: Colors.white),
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                detailInfoCard("Order ID#", gkOrder),
                detailInfoCard("Shipping Line", shippingline),
                detailInfoCard("Tipe", type),
                detailInfoCard("Status", status),
              ],
            )),
      ],
    ),
  );
}
