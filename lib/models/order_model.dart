class Order {
  String orderId, etd, containerNum, orderStatus, slName, vesselName;
  String voyageNum,
      driverName,
      policePlate,
      origin,
      originAdress,
      destination,
      destAddress;
  int driverStatus;

  Order({
    required this.orderId,
    required this.etd,
    required this.containerNum,
    required this.orderStatus,
    required this.driverStatus,
    required this.slName,
    required this.vesselName,
    required this.voyageNum,
    required this.driverName,
    required this.policePlate,
    required this.origin,
    required this.originAdress,
    required this.destination,
    required this.destAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["gk_order"],
        etd: json["ETD"] ?? "Unknown",
        containerNum: json["no_container"] ?? "Unknown",
        orderStatus: json["status_order"].toString(),
        driverStatus: json["status_driver"],
        slName: json["sl_name"] ?? "Unknown",
        vesselName: json["vessel_name"] ?? "Unknown",
        voyageNum: json["voyage_number"] ?? "Unknown",
        driverName: json["name"] ?? "Unknown",
        policePlate: json["no_polisi"] ?? "Unknown",
        origin: json["nama_port"] ?? "Unknown",
        originAdress: json["address_port"] ?? "Unknown",
        destination: json["nama_gudang"] ?? "Unknown",
        destAddress: json["address_gudang"] ?? "Unknown",
      );
}

List orderMessage = [
  "Pekerjaan diterima.",
  "Menuju pelabuhan.",
  "Tiba di pelabuhan.",
  "Muat di pelabuhan.",
  "Menunggu keluar pelabuhan.",
  "Menuju gudang consignee.",
  "Tiba di gudang consignee.",
  "Bongkar muat.",
  "Menuju depo.",
  "Tiba di depo.",
  "Cek kontainer.",
  "Keluar depo",
  "Menuju gudang shipper",
  "Tiba digudang shipper",
  "Muat barang",
  "Menuju pelabuhan",
  "Tiba di pelabuhan.",
  "Selesai",
];
