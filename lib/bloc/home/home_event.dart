
import 'package:weather/datasource/data/model/request/home_request.dart';

abstract class HomeEvent {}

class GetDataHomeEvent extends HomeEvent{
  // có sử dụng data
final HomeRequest? homeRequest;
  GetDataHomeEvent({this.homeRequest});
}
// //
// class GetWeatherNowEvent extends HomeEvent{
//   final double? lat,lon;
//   GetWeatherNowEvent({this.lat,this.lon});
// }



