import 'package:bokshaul_haulier/components/invoices/invoice_api.dart';
import 'package:bokshaul_haulier/components/invoices/invoice_list.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/invoice_model.dart';
import 'package:bokshaul_haulier/screens/logged/invoice/detail_invoice_screen.dart';
import 'package:flutter/material.dart';

class InvoicePaid extends StatefulWidget {
  const InvoicePaid({Key? key}) : super(key: key);

  @override
  _InvoicePaidState createState() => _InvoicePaidState();
}

class _InvoicePaidState extends State<InvoicePaid> {
  late Future<List<Invoice>> futureInvoice;
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Invoice>>(
      future: futureInvoice,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Data tidak ditermukan',
                style: kHeadlineSmall,
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => navigateTo(
                    context,
                    DetailInvoice(
                      id: snapshot.data![index].gateId,
                      current: snapshot.data![index],
                    ),
                  ),
                  child: paidTile(
                      snapshot.data![index].invoiceImport,
                      snapshot.data![index].createdAt,
                      snapshot.data![index].slName,
                      snapshot.data![index].voyageNum,
                      snapshot.data![index].driverName,
                      snapshot.data![index].policePlate,
                      snapshot.data![index].price),
                );
              });
        }
        return showLoading(context, true);
      },
    );
  }

  void _refreshData() {
    futureInvoice = fetchPaidInvoiceList();
  }
}
