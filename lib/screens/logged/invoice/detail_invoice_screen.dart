import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class DetailInvoice extends StatefulWidget {
  const DetailInvoice({Key? key}) : super(key: key);

  @override
  _DetailInvoiceState createState() => _DetailInvoiceState();
}

class _DetailInvoiceState extends State<DetailInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Invoice"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/boksman_logo.png',
                    ),
                  ),
                  Text(
                    "IMP-250621-CMAC 1230001-1",
                    style: kHeadlineSmall.copyWith(fontSize: 12),
                  ),
                  Text(
                    "2021-06-25 18:32:03",
                    style: kBodySmall.copyWith(color: Colors.blueGrey),
                  ),
                  detailInfoCard("Shipping Line", "CMA CGM"),
                  const SizedBox(height: 10),
                  detailInfoCard("Voyage Numbere", "511S"),
                  const SizedBox(height: 10),
                  detailInfoCard("Driver Name", "Ade Rohman"),
                  const SizedBox(height: 10),
                  detailInfoCard("No. Polisi", "B9002UEI"),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    detailCard("Washing By Water", "200,000"),
                    const SizedBox(height: 10),
                    detailCard("Detention", "0"),
                    const SizedBox(height: 10),
                    detailCard("Demurrage", "0"),
                    const SizedBox(height: 10),
                    detailCard("Lift Off", "200,000"),
                    const SizedBox(height: 10),
                    detailCard("Admin Fee", "200,000"),
                    const SizedBox(height: 10),
                    detailCard("Other Charges", "200,000"),
                    const Divider(thickness: 2),
                    detailCard("Total", "600,000"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
