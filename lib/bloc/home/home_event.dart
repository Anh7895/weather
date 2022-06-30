
import 'package:weather/datasource/data/model/request/home_request.dart';

abstract class HomeEvent {}

class GetDataHomeEvent extends HomeEvent{
final HomeRequest? homeRequest;
  GetDataHomeEvent({this.homeRequest});
}


