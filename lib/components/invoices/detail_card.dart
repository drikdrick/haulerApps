import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/invoice_detail_model.dart';
import 'package:flutter/material.dart';

Widget detailCard(String process, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(process, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(
        "Rp" + price,
        style: kHeadlineSmall.copyWith(
          color: Colors.blue,
          fontSize: 12,
        ),
      ),
    ],
  );
}

Widget detailInfoCard(String info, String description) {
  if (description == '1' || description == '4' || description == 'inbound') {
    description = 'Inbound/Import';
  } else if (description == '2' ||
      description == '3' ||
      description == 'outbound') {
    description = 'Outbound/Eksport';
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(info, style: const TextStyle(fontWeight: FontWeight.bold)),
      Flexible(
        child: Text(
          description,
          textAlign: TextAlign.end,
          overflow: TextOverflow.clip,
        ),
      ),
    ],
  );
}

Widget addressSolution(String type, String origin, String oriAddress,
    String destination, String desAddress) {
  if (type == '1' || type == '4' || type == 'inbound') {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Asal :"),
          Text(origin, style: kHeadlineSmall),
          Text(oriAddress),
          const SizedBox(height: 10),
          const Text("Tujuan :"),
          Text(destination, style: kHeadlineSmall),
          Text(desAddress),
          const SizedBox(height: 10)
        ],
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Asal :"),
          Text(destination, style: kHeadlineSmall),
          Text(desAddress),
          const SizedBox(height: 10),
          const Text("Tujuan :"),
          Text(origin, style: kHeadlineSmall),
          Text(oriAddress),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

List<Widget> priceList(InvoiceDetail data) {
  List<Widget> bon = [];
  for (var i = 0; i < data.dataInvoice.length; i++) {
    bon.add(
        detailCard(data.dataInvoice[i].keterangan, data.dataInvoice[i].harga));
    bon.add(
      const SizedBox(height: 10),
    );
  }
  return bon;
}
