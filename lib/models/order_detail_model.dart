class OrderDetail {
  OrderDetail({
    required this.gkOrder,
    required this.namaDriver,
    required this.noPolisi,
    required this.companyName,
    required this.noContainer,
    required this.statusOrder,
    required this.statusDriver,
    required this.slName,
    required this.origin,
    required this.destination,
    required this.originCoordinate,
    required this.destinationCoordinate,
  });

  String gkOrder;
  String namaDriver;
  String noPolisi;
  String companyName;
  String noContainer;
  String statusOrder;
  int statusDriver;
  String slName;
  String origin;
  String destination;
  String originCoordinate;
  String destinationCoordinate;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        gkOrder: json["gk_order"],
        namaDriver: json["nama_driver"],
        noPolisi: json["no_polisi"],
        companyName: json["company_name"],
        noContainer: json["no_container"],
        statusOrder: json["status_order"],
        statusDriver: json["status_driver"],
        slName: json["sl_name"],
        origin: json["origin"],
        destination: json["destination"],
        originCoordinate: json["origin_coordinate"],
        destinationCoordinate: json["destination_coordinate"],
      );

  Map<String, dynamic> toJson() => {
        "gk_order": gkOrder,
        "nama_driver": namaDriver,
        "no_polisi": noPolisi,
        "company_name": companyName,
        "no_container": noContainer,
        "status_order": statusOrder,
        "status_driver": statusDriver,
        "sl_name": slName,
        "origin": origin,
        "destination": destination,
        "origin_coordinate": originCoordinate,
        "destination_coordinate": destinationCoordinate,
      };
}
