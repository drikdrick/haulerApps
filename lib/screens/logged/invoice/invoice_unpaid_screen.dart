import '../../../components/invoices/invoice_api.dart';
import '../../../components/invoices/invoice_list.dart';
import '../../../helpers/layout.dart';
import '../../../helpers/text_style.dart';
import '../../../models/invoice_model.dart';
import 'package:flutter/material.dart';

import 'detail_invoice_screen.dart';

class InvoiceUnpaid extends StatefulWidget {
  const InvoiceUnpaid({Key? key}) : super(key: key);

  @override
  _InvoiceUnpaidState createState() => _InvoiceUnpaidState();
}

class _InvoiceUnpaidState extends State<InvoiceUnpaid> {
  int totalHarga = 0;
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
          return Scaffold(
            body: ListView.builder(
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
                    child: unpaidTile(
                        snapshot.data![index].invoiceImport,
                        snapshot.data![index].dueData,
                        snapshot.data![index].createdAt,
                        snapshot.data![index].slName,
                        snapshot.data![index].voyageNum,
                        snapshot.data![index].driverName,
                        snapshot.data![index].policePlate,
                        snapshot.data![index].price),
                  );
                }),
            // bottomSheet: ,
          );
        }
        return showLoading(context, true);
      },
    );
  }

  void _refreshData() {
    futureInvoice = fetchUnpaidInvoiceList();
  }
}
