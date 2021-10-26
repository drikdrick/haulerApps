import '../../../components/orders/order_api.dart';
import '../../../components/orders/order_cards.dart';
import '../../../helpers/layout.dart';
import '../../../helpers/text_style.dart';
import '../../../models/order_model.dart';
import 'detail_pending_screen.dart';
import 'package:flutter/material.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  final bool _isLoading = false;
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/truck.png",
                        width: layoutWidth(context) / 2,
                      ),
                      Text(
                        "Order kamu kosong, ayo segera order!",
                        style: kBody,
                      ),
                    ],
                  ),
                );
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
