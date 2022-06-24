
import 'package:weather/common/config/enum.dart';

abstract class HomeEvent {}
class GetWeatherNowEvent extends HomeEvent{
  final double? lat,lon;
  GetWeatherNowEvent({this.lat,this.lon});
}

