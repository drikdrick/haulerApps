import 'dart:async';

import '../../../models/order_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final OrderDetail order;
  const MapSample({Key? key, required this.order}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = {};
  late List<String> origin, destination;
  late LatLng latLngDestination, latLngOrigin, center;
  late LatLngBounds bound;
  @override
  void initState() {
    origin = widget.order.originCoordinate.split(',');
    destination = widget.order.destinationCoordinate.split(',');
    latLngDestination =
        LatLng(double.parse(destination[0]), double.parse(destination[1]));
    latLngOrigin = LatLng(double.parse(origin[0]), double.parse(origin[1]));
    center = LatLng(
      (latLngDestination.latitude + latLngOrigin.latitude) / 2,
      (latLngDestination.longitude + latLngOrigin.longitude) / 2,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: center, //initial position
          zoom: 10,
          //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(
      () {
        markers.add(Marker(
          //add first marker
          markerId: const MarkerId("origin/Consignee"),
          position: LatLng(
            double.parse(origin[0]),
            double.parse(origin[1]),
          ), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: widget.order.origin,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure), //Icon for Marker
        ));

        markers.add(
          Marker(
            //add second marker
            markerId: const MarkerId("destination"),
            position: LatLng(
              double.parse(destination[0]),
              double.parse(destination[1]),
            ), //position of marker
            infoWindow: InfoWindow(
              //popup info
              title: widget.order.destination,
            ),
            icon: BitmapDescriptor.defaultMarker, //Icon for Marker
          ),
        );
      },
    );

    return markers;
  }
}
