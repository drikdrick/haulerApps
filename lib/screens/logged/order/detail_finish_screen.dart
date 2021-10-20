import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/components/orders/info_card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:flutter/material.dart';

class DetailFinish extends StatelessWidget {
  final Order currentOrder;
  const DetailFinish({Key? key, required this.currentOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Pending"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text("General Information"),
                    const Divider(),
                    detailInfoCard("Order ID#", currentOrder.orderId),
                    detailInfoCard("ETD", currentOrder.etd),
                    detailInfoCard("Shipping Line", currentOrder.slName),
                    detailInfoCard("Vessel Name", currentOrder.vesselName),
                    detailInfoCard("Voyage Number", currentOrder.voyageNum),
                    detailInfoCard("Type", currentOrder.orderStatus),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text("Unit Information"),
                    const Divider(),
                    detailInfoCard("No. Container", currentOrder.containerNum),
                    detailInfoCard("Driver Name", currentOrder.driverName),
                    detailInfoCard("No. Polisi", currentOrder.policePlate),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              color: Colors.white,
              width: layoutWidth(context),
              child: addressSolution(
                  currentOrder.orderStatus,
                  currentOrder.origin,
                  currentOrder.originAdress,
                  currentOrder.destination,
                  currentOrder.destAddress),
            ),
            const Divider(),
            Container(
                color: Colors.white,
                width: layoutWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Milestones"),
                      const Divider(),
                      ...doneMilestones(currentOrder),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
