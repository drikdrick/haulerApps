import 'package:bokshaul_haulier/components/invoices/detail_card.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class InvoiceUnpaid extends StatefulWidget {
  const InvoiceUnpaid({Key? key}) : super(key: key);

  @override
  _InvoiceUnpaidState createState() => _InvoiceUnpaidState();
}

class _InvoiceUnpaidState extends State<InvoiceUnpaid> {
  bool _checkedAll = false;
  bool _checkedSingle = false;
  int totalHarga = 0;
  int hargaSatuan = 600000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          unpaidTile(context),
          unpaidTile(context),
          unpaidTile(context),
          unpaidTile(context),
          unpaidTile(context),
          unpaidTile(context),
          unpaidTile(context),
          const SizedBox(height: 70),
        ],
      ),
      bottomSheet: Row(
        children: [
          Container(
            height: 75,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(),
              ),
            ),
            width: layoutWidth(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                          value: _checkedAll,
                          onChanged: (value) {
                            setState(() {
                              _checkedAll = value!;
                              if (!_checkedAll) {
                                totalHarga = 0;
                              } else {
                                totalHarga = 600000 * 9;
                              }
                            });
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Pililh Semua"),
                          Text(
                            "Rp" + totalHarga.toString(),
                            style: kHeadlineSmall.copyWith(color: Colors.blue),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: 125,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Bayar",
                        style: kHeadlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget unpaidTile(BuildContext context) {
    return SizedBox(
      width: layoutWidth(context),
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
              const Divider(thickness: 2,),
              Row(
                children: [
                  Checkbox(
                    value: _checkedSingle,
                    onChanged: (value) {
                      setState(
                        () {
                          _checkedSingle = value!;
                          if (!_checkedSingle) {
                            totalHarga = 0;
                          } else {
                            totalHarga = 600000;
                          }
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        detailInfoCard("Shipping Line", "CMA CGM"),
                        detailInfoCard("Voyage Number", "511S"),
                        detailInfoCard("Driver Name", "Ade Rohman"),
                        detailInfoCard("No. Polisi", "B9002UEI"),
                        detailCard("Total", '600,000'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
