import 'package:weather/bloc/base_state/base_state.dart';
import 'package:weather/datasource/data/model/reponse/home_response.dart';

abstract class HomeState extends BaseState {}

class StartHomeState extends HomeState {}
class GetDataHomeSuccessState extends HomeState{
final HomeResponse homeResponse;

  GetDataHomeSuccessState({required this.homeResponse});

}

