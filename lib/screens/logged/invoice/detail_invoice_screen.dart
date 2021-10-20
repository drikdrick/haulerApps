import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/components/invoices/invoice_api.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/invoice_detail_model.dart';
import 'package:bokshaul_haulier/models/invoice_model.dart';
import 'package:flutter/material.dart';

class DetailInvoice extends StatefulWidget {
  final int id;
  final Invoice current;
  const DetailInvoice({Key? key, required this.id, required this.current}) : super(key: key);

  @override
  _DetailInvoiceState createState() => _DetailInvoiceState();
}

class _DetailInvoiceState extends State<DetailInvoice> {
  late Future<InvoiceDetail> futureInvoice;
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Invoice"),
      ),
      body: FutureBuilder<InvoiceDetail>(
        future: futureInvoice,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
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
                        widget.current.invoiceImport,
                        style: kHeadlineSmall.copyWith(fontSize: 12),
                      ),
                      Text(
                        widget.current.createdAt,
                        style: kBodySmall.copyWith(color: Colors.blueGrey),
                      ),
                      detailInfoCard("Shipping Line", widget.current.slName),
                      const SizedBox(height: 10),
                      detailInfoCard("Voyage Numbere", widget.current.voyageNum),
                      const SizedBox(height: 10),
                      detailInfoCard("Driver Name", widget.current.driverName),
                      const SizedBox(height: 10),
                      detailInfoCard("No. Polisi", widget.current.policePlate),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...priceList(snapshot.data!),
                        const Divider(thickness: 2),
                        detailCard("Total", snapshot.data!.totalHarga),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return showLoading(context, true);
        },
      ),
    );
  }

  void _refreshData() {
    futureInvoice = fetchDetailInvoice(widget.id);
  }
}
