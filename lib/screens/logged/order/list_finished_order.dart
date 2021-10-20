import 'package:bokshaul_haulier/components/orders/order_api.dart';
import 'package:bokshaul_haulier/components/orders/order_cards.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:flutter/material.dart';

class FinishedOrder extends StatefulWidget {
  const FinishedOrder({Key? key}) : super(key: key);

  @override
  _FinishedOrderState createState() => _FinishedOrderState();
}

class _FinishedOrderState extends State<FinishedOrder> {
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
                return displayOrder(
                    Colors.blueGrey.withOpacity(0.75),
                    doneOrder[index].origin,
                    doneOrder[index].destination,
                    doneOrder[index].orderId,
                    doneOrder[index].orderStatus,
                    orderMessage[17],
                    doneOrder[index].slName);
              },
            );
          }
          return showLoading(context, true);
        });
  }

  void _refreshData() {
    futureOrder = fetchFinishedOrder();
  }
}
