import 'package:flutter/material.dart';

import 'order_cards.dart';

Widget listOrderPending(){
  return ListView(
    children: [
      displayOrder(Colors.orange, "portName", "houseName", "GK_ORDER",
                        "type", "Status", "CMA CGM"),
    ],
  );
}