import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

getMarkers() async => <MarkerInfo>[
  MarkerInfo(
      status: Set.from(["ACTIVELOW"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 120)),
      description: "Trạm sẵn sàng"),
  MarkerInfo(
      status: Set.from(["ACTIVEHIGHT"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 150)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 150)),
      description: "Trạm sẵn sàng"),
  MarkerInfo(
      status: Set.from(["ACTIVEMEDIUM"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_ready.png', 120)),
      description: "Trạm sẵn sàng"),
  MarkerInfo(
      status: Set.from(["UNDEFINED", "UPGRADING"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_not_ready.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_not_ready.png', 120)),
      description: "Trạm chưa sẵn sàng"),
  MarkerInfo(
      status: Set.from(["INACTIVE"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_inactive.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_inactive.png', 120)),
      description: "Trạm không hoạt động"),
  MarkerInfo(
      status: Set.from(["REPAINLOW"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 120)),
      description: "Dịch vụ sửa chữa xe điện"),
  MarkerInfo(
      status: Set.from(["REPAINMEDIUM"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 110)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 110)),
      description: "Dịch vụ sửa chữa xe điện"),
  MarkerInfo(
      status: Set.from(["REPAINHIGHT"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 150)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 150)),
      description: "Dịch vụ sửa chữa xe điện"),
  MarkerInfo(
      status: Set.from(["RENTALLOW"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_rental.png', 120)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_repair.png', 120)),
      description: "Dịch vụ sửa chữa xe điện"),
  MarkerInfo(
      status: Set.from(["RENTALMEDIUM"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_rental.png', 110)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_rental.png', 110)),
      description: "Dịch vụ sửa chữa xe điện"),
  MarkerInfo(
      status: Set.from(["RENTALHIGHT"]),
      iconMarker: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_rental.png', 150)),
      iconSelect: BitmapDescriptor.fromBytes(await getBytesFromAsset(
          'assets/icons/png/ic_station_rental.png', 150)),
      description: "Dịch vụ sửa chữa xe điện"),
];

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

double getZoomLevel(double radius) {
  double zoomLevel = 11;
  if (radius > 0) {
    double radiusElevated = radius + radius / 2;
    double scale = radiusElevated / 500;
    zoomLevel = 16 - log(scale) / log(2);
  }
  zoomLevel = num.parse(zoomLevel.toStringAsFixed(2)).toDouble();
  return zoomLevel;
}

double coordinateDistance(lat1, lng1, lat2, lng2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

class MarkerInfo {
  Set<String>? status;
  BitmapDescriptor? iconMarker;
  BitmapDescriptor? iconSelect;
  String? description;

  MarkerInfo({
    this.status,
    this.iconMarker,
    this.iconSelect,
    this.description,
  });
}
