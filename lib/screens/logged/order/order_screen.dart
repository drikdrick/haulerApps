import 'package:bokshaul_haulier/components/orders/current_order_list.dart';
import 'package:bokshaul_haulier/components/orders/done_order_list.dart';
import 'package:bokshaul_haulier/components/orders/pending_order_list.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/logged/invoice/invoice_screen.dart';
import 'package:bokshaul_haulier/screens/logged/order/detail_finish_screen.dart';
import 'package:bokshaul_haulier/screens/logged/order/detail_pending_screen.dart';
import 'package:flutter/material.dart';

import 'detail_ongoing_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final bool _isLoading = false;
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
        child: Stack(
          children: [
            SafeArea(
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
                  Expanded(
                    child: TabBarView(children: [
                      InkWell(
                        child: listOrderBerlangsung(),
                        onTap: () => navigateTo(context, const DetailOngoing()),
                      ),
                      InkWell(
                        child: listOrderPending(),
                        onTap: () => navigateTo(context, const DetailPending()),
                      ),
                      InkWell(
                        child: listOrderSelesai(),
                        onTap: () => navigateTo(context, const DetailFinish()),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            showLoading(context, _isLoading)
          ],
        ),
      ),
    );
  }
}
