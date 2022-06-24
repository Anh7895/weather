import 'package:dio/dio.dart';
import 'package:weather/bloc/base_state/base_state.dart';
import 'package:bloc/bloc.dart';
import 'package:weather/datasource/data/model/request/weather_request.dart';
import 'package:weather/datasource/data/model/response/weather_model.dart';

import '../../datasource/repository/weather_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final WeatherRepository weatherRepository;

  HomeBloc(this.weatherRepository) : super(StartHomeState()) {
    //Validate
    on<GetWeatherNowEvent>((event, emit) => getWeatherNow(event, emit));
  }

  WeatherNowModel weatherNowModel = WeatherNowModel();
  Future<void> getWeatherNow(
      GetWeatherNowEvent event, Emitter<BaseState> emit) async {
    WeatherRequest request = await buildWeatherRequest(event);
    emit(StartCallApiState());
    try {
      final response = await weatherRepository.getWeatherNow(request);
      weatherNowModel = response;
      emit(GetWeatherSuccessState());
    } on DioError catch (e) {
      emit(ApiErrorState(error: e));
    } catch (e) {
      emit(ApiErrorState(error: e));
    }
  }
  Future<WeatherRequest> buildWeatherRequest(GetWeatherNowEvent event) async {
    return WeatherRequest(
      lat:event.lat ?? 51.507336,
      lon: event.lon ?? -0.127348,
      appId: '36c6afeee531eb6d4daaf6265cc4739d'
    );
  }
}

