import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class WeatherRequest extends Equatable {
  final double? lat,lon;
  final String? appId;

  @override
  // TODO: implement props
  List<Object?> get props => [];

  WeatherRequest(
      {this.lat,
      this.lon,
      this.appId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lat != null) {
      data['lat'] = this.lat;
    }
    if (this.lon != null) {
      data['lon'] = this.lon;
    }
    if (this.appId != null) {
      data['appid'] = this.appId;
    }

    return data;
  }
}
