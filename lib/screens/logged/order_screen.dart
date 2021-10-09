import 'package:bokshaul_haulier/components/orders/current_order_list.dart';
import 'package:bokshaul_haulier/components/orders/done_order_list.dart';
import 'package:bokshaul_haulier/components/orders/pending_order_list.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                    unselectedLabelStyle: kSecTitle.copyWith(fontSize: 14),
                    labelStyle: kTitle.copyWith(fontSize: 14),
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
                listOrderBerlangsung(),
                listOrderPending(),
                listOrderSelesai()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
