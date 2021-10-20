import 'package:bokshaul_haulier/components/orders/order_api.dart';
import 'package:bokshaul_haulier/components/orders/order_cards.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:bokshaul_haulier/screens/logged/order/detail_ongoing_screen.dart';
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
                if (doneOrder[index].orderStatus == '1' ||
                    doneOrder[index].orderStatus == '4' ||
                    doneOrder[index].orderStatus == 'inbound') {
                  header = Colors.green;
                } else if (doneOrder[index].orderStatus == '2' ||
                    doneOrder[index].orderStatus == '3' ||
                    doneOrder[index].orderStatus == 'outbound') {
                  header = Colors.blue;
                }
                String message =
                    orderMessage[snapshot.data![index].driverStatus+ 4];

                return InkWell(
                  onTap: (){
                    navigateTo(context, const DetailOngoing());
                  },
                  child: displayOrder(
                      header,
                      doneOrder[index].origin,
                      doneOrder[index].destination,
                      doneOrder[index].orderId,
                      doneOrder[index].orderStatus,
                      message,
                      doneOrder[index].slName),
                );
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
