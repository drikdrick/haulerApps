import 'package:bokshaul_haulier/components/orders/order_api.dart';
import 'package:bokshaul_haulier/components/orders/order_cards.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:flutter/material.dart';

class LimitOrder extends StatefulWidget {
  const LimitOrder({Key? key}) : super(key: key);

  @override
  LimitOrderState createState() => LimitOrderState();
}

class LimitOrderState extends State<LimitOrder> {
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

            return Column(
              children: [
                Text(
                  "Order Saat Ini",
                  style: kTitle.copyWith(fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      late Color header;
                      if (snapshot.data![index].orderStatus == '1' ||
                          snapshot.data![index].orderStatus == '4' ||
                          snapshot.data![index].orderStatus == 'inbound') {
                        header = Colors.green;
                      } else if (snapshot.data![index].orderStatus == '2' ||
                          snapshot.data![index].orderStatus == '3' ||
                          snapshot.data![index].orderStatus == 'outbound') {
                        header = Colors.blue;
                      }
                      String message =
                          orderMessage[snapshot.data![index].driverStatus+ 4];

                      return displayOrder(
                          header,
                          snapshot.data![index].origin,
                          snapshot.data![index].destination,
                          snapshot.data![index].orderId,
                          snapshot.data![index].orderStatus,
                          message,
                          snapshot.data![index].slName);
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  void _refreshData() {
    futureOrder = fetchLimitedOrder();
  }
}
