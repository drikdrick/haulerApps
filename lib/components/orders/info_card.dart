import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:flutter/material.dart';

Widget statusOrder(String msg) {
  return SizedBox(
    height: 50,
    child: ListTile(
      leading: const Icon(
        Icons.library_add_check_rounded,
        color: Colors.blue,
      ),
      title: Text(msg),
      // subtitle: const Text("--:--"),
      // dense: true,
    ),
  );
}

List<Widget> doneMilestones(Order order) {
  List<Widget> milestone = [];
  if (order.orderStatus == '1' ||
      order.orderStatus == '4' ||
      order.orderStatus == 'inbound') {
    for (var i = -4; i < order.driverStatus; i++) {
      if (i >= 8 && i <= 12) {
        continue;
      }
      milestone.add(statusOrder(orderMessage[i + 4]));
    }
  } else if (order.orderStatus == '2' ||
      order.orderStatus == '3' ||
      order.orderStatus == 'outbound') {
    for (var i = 4; i < order.driverStatus; i++) {
      milestone.add(statusOrder(orderMessage[i + 4]));
    }
  }
  return milestone;
}
