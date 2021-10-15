import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/logged/invoice/detail_invoice_screen.dart';
import 'package:flutter/material.dart';

class InvoicePaid extends StatefulWidget {
  const InvoicePaid({Key? key}) : super(key: key);

  @override
  _InvoicePaidState createState() => _InvoicePaidState();
}

class _InvoicePaidState extends State<InvoicePaid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          paidTile(context),
          paidTile(context),
          paidTile(context),
          paidTile(context),
          paidTile(context),
          paidTile(context),
          paidTile(context),
        ],
      ),
    );
  }

  Widget paidTile(BuildContext context) {
    return InkWell(
      onTap: ()=>navigateTo(context, const DetailInvoice()),
      child: Card(
        shadowColor: Colors.blue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "IMP-250621-CMAC 1230001-1",
                    style: kHeadlineSmall.copyWith(fontSize: 12),
                  ),
                  Text(
                    "2021-06-25 18:32:03",
                    style: kBodySmall.copyWith(color: Colors.blueGrey),
                  ),
                ],
              ),
              const Divider(),
              detailInfoCard("Shipping Line", "CMA CGM"),
              detailInfoCard("Voyage Number", "511S"),
              detailInfoCard("Driver Name", "Ade Rohman"),
              detailInfoCard("No. Polisi", "B9002UEI"),
              detailCard("Total", '600,000'),
            ],
          ),
        ),
      ),
    );
  }
}
