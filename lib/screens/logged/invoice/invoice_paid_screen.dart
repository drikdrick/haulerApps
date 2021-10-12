import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class InvoicePaid extends StatefulWidget {
  const InvoicePaid({Key? key}) : super(key: key);

  @override
  _InvoicePaidState createState() => _InvoicePaidState();
}

class _InvoicePaidState extends State<InvoicePaid> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        paidTile(context),
        paidTile(context),
        paidTile(context),
        paidTile(context),
        paidTile(context),
        paidTile(context),
        paidTile(context),
      ],
    );
  }

  Widget paidTile(BuildContext context) {
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
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Shipping Line"),
                      const Text("Voyage Number"),
                      const Text("Driver Name"),
                      const Text("No. Polisi"),
                      Text(
                        "Total",
                        style: kHeadlineSmall.copyWith(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("CMA CGM"),
                      const Text("511S"),
                      const Text("Ade Rohman"),
                      const Text("B9002UEI"),
                      Text(
                        "Rp600.000",
                        style: kHeadlineSmall.copyWith(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
