class Invoice {
  int gateId;
  String containerNum, invoiceImport, companyName;
  String slName, voyageNum, driverName, policePlate;
  String price, dueData, createdAt;

  Invoice({
    required this.gateId,
    required this.containerNum,
    required this.invoiceImport,
    required this.companyName,
    required this.slName,
    required this.voyageNum,
    required this.driverName,
    required this.policePlate,
    required this.price,
    required this.dueData,
    required this.createdAt,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        gateId: json["id_gate"],
        containerNum: json["no_container"],
        invoiceImport: json["invoice_import"],
        companyName: json["company_name"] ?? "Unknown",
        slName: json["sl_name"],
        voyageNum: json["voyage_number"],
        driverName: json["name"],
        policePlate: json["no_polisi"],
        price: json["harga_depo"],
        dueData: json["due_date"],
        createdAt: json["created_at"],
      );
}
