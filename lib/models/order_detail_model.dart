class OrderDetail {
  String gkNumber, forwarder, driverName, truckerName, policeNum;
  String shipLine, shipperName, shipperAddress, orderType, containerNum;
  String origin,
      destination,
      originLat,
      originLong,
      destinationLat,
      destinationLong;
  int driverStatus;

  OrderDetail({
    required this.gkNumber,
    required this.forwarder,
    required this.driverName,
    required this.truckerName,
    required this.policeNum,
    required this.shipLine,
    required this.shipperName,
    required this.shipperAddress,
    required this.orderType,
    required this.containerNum,
    required this.origin,
    required this.destination,
    required this.originLat,
    required this.originLong,
    required this.destinationLat,
    required this.destinationLong,
    required this.driverStatus,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        gkNumber: json["gk_number"],
        forwarder: json["forwarder"],
        driverName: json["nama_driver"],
        truckerName: json["nama_trucker"],
        policeNum: json["no_polisi"],
        shipLine: json["nama_sl"],
        shipperName: json["shipper"],
        shipperAddress: json["alamat_shp"],
        orderType: json["type_order"],
        containerNum: json["no_container"],
        origin: json["origin"],
        destination: json["destination"],
        originLat: json["lat_origin"],
        originLong: json["long_origin"],
        destinationLat: json["lat_destination"],
        destinationLong: json["long_destination"],
        driverStatus: json["status_driver"],
      );
}
