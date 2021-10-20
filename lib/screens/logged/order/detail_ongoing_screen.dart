import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/components/orders/info_card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/order_detail_model.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:bokshaul_haulier/screens/logged/order/map_app.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailOngoing extends StatefulWidget {
  final Order currentOrder;
  final OrderDetail currentDetail;
  const DetailOngoing(
      {Key? key, required this.currentOrder, required this.currentDetail})
      : super(key: key);

  @override
  _DetailOngoingState createState() => _DetailOngoingState();
}

class _DetailOngoingState extends State<DetailOngoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Berlangsung"),
      ),
      body: SlidingUpPanel(
        color: Colors.white.withOpacity(0.75),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        backdropEnabled: true,
        maxHeight: layoutHeight(context) * 0.8,
        minHeight: 120,
        panel: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 40,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 75,
                      child:
                          Image(image: AssetImage("assets/images/truck.png")),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderMessage[widget.currentOrder.driverStatus + 4],
                            style: kHeadlineSmall,
                            overflow: TextOverflow.visible,
                          ),
                          const Text("Achmad Subandy"),
                          const Text("B 5146 IAN"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(thickness: 2),
              detailInfoCard("Order ID#", widget.currentOrder.orderId),
              detailInfoCard("ETD", widget.currentOrder.etd),
              detailInfoCard("Shipping Line", widget.currentOrder.slName),
              detailInfoCard("Vessel Name", widget.currentOrder.vesselName),
              detailInfoCard("Voyage Number", widget.currentOrder.voyageNum),
              detailInfoCard("Container Number", widget.currentOrder.containerNum),
              detailInfoCard("Type", widget.currentOrder.orderStatus),
              const Divider(thickness: 2),
              addressSolution(
                  widget.currentOrder.orderStatus,
                  widget.currentOrder.origin,
                  widget.currentOrder.originAdress,
                  widget.currentOrder.destination,
                  widget.currentOrder.destAddress),
              const Divider(thickness: 2),
              Expanded(
                child: ListView(
                  children: [...doneMilestones(widget.currentOrder)],
                ),
              )
            ],
          ),
        ),
        body: const MapSample(),
      ),
    );
  }
}
