import 'package:flutter/material.dart';

class InvoiceUnpaid extends StatefulWidget {
  const InvoiceUnpaid({ Key? key }) : super(key: key);

  @override
  _InvoiceUnpaidState createState() => _InvoiceUnpaidState();
}

class _InvoiceUnpaidState extends State<InvoiceUnpaid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Belum bayar'),
      bottomSheet: Container(
        child: Text("BottomSheet"),
      ),
    );
  }
}