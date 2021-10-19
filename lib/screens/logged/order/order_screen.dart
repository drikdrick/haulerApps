import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/logged/invoice/invoice_screen.dart';
import 'package:bokshaul_haulier/screens/logged/order/list_finished_order.dart';
import 'package:bokshaul_haulier/screens/logged/order/list_ongoing_order.dart';
import 'package:bokshaul_haulier/screens/logged/order/list_pending_order.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Saya"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => navigateTo(
              context,
              const InvoiceScreen(),
            ),
            icon: const Icon(Icons.document_scanner_rounded),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TabBar(
                      labelStyle: kHeadlineSmall,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.lightBlue,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      tabs: const [
                        Tab(text: "Berlangsung"),
                        Tab(text: "Pending"),
                        Tab(text: "Selesai"),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const Expanded(
                child: TabBarView(children: [
                  OngoingOrder(),
                  PendingOrder(),
                  FinishedOrder(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
