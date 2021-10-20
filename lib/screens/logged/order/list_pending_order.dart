import 'package:bokshaul_haulier/components/orders/order_api.dart';
import 'package:bokshaul_haulier/components/orders/order_cards.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:bokshaul_haulier/screens/logged/order/detail_pending_screen.dart';
import 'package:flutter/material.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  bool _isLoading = false;
  late Future<List<Order>> futureOrder;
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Order>>(
          future: futureOrder,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Order> pendingOrder = snapshot.data!;
              if (snapshot.data!.isEmpty) {
                return Center(
                    child: Text("Data tidak ditermukan.", style: kHeadline));
              }
              return ListView.builder(
                itemCount: pendingOrder.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navigateTo(context,
                          DetailPending(currentOrder: pendingOrder[index]));
                    },
                    child: displayOrder(
                        Colors.orange,
                        pendingOrder[index].origin,
                        pendingOrder[index].destination,
                        pendingOrder[index].orderId,
                        pendingOrder[index].orderStatus,
                        "-",
                        pendingOrder[index].slName),
                  );
                },
              );
            }
            return showLoading(context, true);
          },
        ),
        showLoading(context, _isLoading),
      ],
    );
  }

  void _refreshData() {
    futureOrder = fetchPendingOrder();
  }
}
