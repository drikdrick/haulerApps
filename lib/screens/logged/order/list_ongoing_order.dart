import 'dart:ffi';

import 'package:bokshaul_haulier/components/orders/order_api.dart';
import 'package:bokshaul_haulier/components/orders/order_cards.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:flutter/material.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({Key? key}) : super(key: key);

  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  late Future<List<Order>> futureOrder;
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: futureOrder,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Order> doneOrder = snapshot.data!;
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Text("Data tidak ditermukan.", style: kHeadline));
            }
            return ListView.builder(
              itemCount: doneOrder.length,
              itemBuilder: (context, index) {
                late Color header;
                if (doneOrder[index].type == '1' ||
                    doneOrder[index].type == '4' ||
                    doneOrder[index].type == 'inbound') {
                  header = Colors.green;
                } else if (doneOrder[index].type == '2' ||
                    doneOrder[index].type == '3' ||
                    doneOrder[index].type == 'outbound') {
                  header = Colors.blue;
                }
                String message =
                    orderMessage[int.parse(doneOrder[index].status) + 4];

                return displayOrder(
                    header,
                    doneOrder[index].origin,
                    doneOrder[index].destination,
                    doneOrder[index].orderId,
                    doneOrder[index].type,
                    message,
                    doneOrder[index].shipline);
              },
            );
          }
          return showLoading(context, true);
        });
  }

  void _refreshData() {
    futureOrder = fetchCurrentOrder();
  }
}
