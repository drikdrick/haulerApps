import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_detail_model.dart';
import 'package:flutter/material.dart';

class DetailPending extends StatelessWidget {
  final OrderDetail currentOrder;
  const DetailPending({Key? key, required this.currentOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Pending"),
      ),
      body: Column(
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
                  detailInfoCard("Order ID#", currentOrder.gkNumber),
                  detailInfoCard("Shipping Line", currentOrder.shipLine),
                  detailInfoCard("Type", currentOrder.orderType),
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
                  detailInfoCard("No. Polisi", currentOrder.policeNum),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Asal", style: kHeadlineSmall),
                    Text(currentOrder.origin),
                    const SizedBox(height: 10),
                    Text("Tujuan", style: kHeadlineSmall),
                    Text(currentOrder.destination),
                    const SizedBox(height: 10)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
