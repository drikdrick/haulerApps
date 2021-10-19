class Order {
  String orderId, origin, destination, type, status, shipline;

  Order({
    required this.orderId,
    required this.origin,
    required this.destination,
    required this.type,
    required this.status,
    required this.shipline,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["gk_order"],
        origin: json["nama_port"],
        destination: json["nama_gudang"] ?? "Unknown",
        type: json["status_order"].toString(),
        status: json["status_driver"].toString(),
        shipline: json["sl_name"],
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
