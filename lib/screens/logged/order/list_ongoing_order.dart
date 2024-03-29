import '../../../components/orders/order_api.dart';
import '../../../components/orders/order_cards.dart';
import '../../../helpers/layout.dart';
import '../../../helpers/text_style.dart';
import '../../../models/order_model.dart';
import 'detail_ongoing_screen.dart';
import 'package:flutter/material.dart';

class OngoingOrder extends StatefulWidget {
  const OngoingOrder({Key? key}) : super(key: key);

  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  late Future<List<Order>> futureOrder;
  bool _isLoading = false;
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
              List<Order> doneOrder = snapshot.data!;
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
                      orderMessage[snapshot.data![index].driverStatus + 4];

                  return InkWell(
                    onTap: () {
                      setState(() {
                        _isLoading = true;
                      });
                      fetchDetailOrder(doneOrder[index].orderId).then(
                        (value) => navigateTo(
                          context,
                          DetailOngoing(
                            currentOrder: snapshot.data![index],
                            currentDetail: value,
                          ),
                        ),
                      );
                      Future.delayed(const Duration(milliseconds: 750))
                          .then((value) {
                        setState(() {
                          _isLoading = false;
                        });
                      });
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
          },
        ),
        showLoading(context, _isLoading),
      ],
    );
  }

  void _refreshData() {
    futureOrder = fetchCurrentOrder();
  }
}
