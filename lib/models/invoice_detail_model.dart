import 'dart:convert';

InvoiceDetail invoiceDetailFromJson(String str) =>
    InvoiceDetail.fromJson(json.decode(str));

String invoiceDetailToJson(InvoiceDetail data) => json.encode(data.toJson());

class InvoiceDetail {
  InvoiceDetail({
    required this.dataInvoice,
    required this.totalHarga,
  });

  List<DataInvoice> dataInvoice;
  String totalHarga;

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) => InvoiceDetail(
        dataInvoice: List<DataInvoice>.from(
            json["data_invoice"].map((x) => DataInvoice.fromJson(x))),
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "data_invoice": List<dynamic>.from(dataInvoice.map((x) => x.toJson())),
        "total_harga": totalHarga,
      };
}

class DataInvoice {
  DataInvoice({
    required this.keterangan,
    required this.harga,
  });

  String keterangan;
  String harga;

  factory DataInvoice.fromJson(Map<String, dynamic> json) => DataInvoice(
        keterangan: json["keterangan"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "keterangan": keterangan,
        "harga": harga,
      };
}
