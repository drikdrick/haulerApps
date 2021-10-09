import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: "Belum Bayar",
                      ),
                      Tab(
                        text: "Selesai",
                      ),
                    ],
                    indicator: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    labelStyle: kTitle.copyWith(fontSize: 14),
                    unselectedLabelStyle: kSecTitle.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Text("Belum Bayar"),
                  Text("Selesai"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
