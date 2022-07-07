import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/bloc/base_state/base_state.dart';
import 'package:bloc/bloc.dart';
import 'package:weather/common/utils/preference_utils.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'package:weather/datasource/data/model/reponse/home_response.dart';
import 'package:weather/datasource/network/dio/api_client.dart';
import 'package:weather/datasource/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(StartHomeState()) {
    on<GetDataHomeEvent>((event, emit) => getHomeWeather(event, emit));
  }

  HomeResponse? homeResponse = LocalUserData.getInstance.homeResponse;
  //
  // Future<HomeRequest> buildHome(GetDataHomeEvent event) async{
  //   return HomeRequest(
  //       appid: '36c6afeee531eb6d4daaf6265cc4739d',
  //       lat: '9.915951',
  //       lon: '105.699334');
  // }
// save Data Home
  saveData(HomeResponse? homeResponse) async{
    return await PreferenceUtils.setString('homeResponse', jsonEncode(homeResponse));
  }
  Future<void> getHomeWeather(
      GetDataHomeEvent event, Emitter<BaseState> emit) async {
    emit(StartCallApiState());
    try {
      final response = await homeRepository.getWeather(event.homeRequest);
      homeResponse = response;
      saveData(homeResponse);
      if (response != null) {
        emit(GetDataHomeSuccessState());
      } else {
        emit(ApiErrorState(errorMessage: "Get data detail false"));
      }
    } on DioError catch (e) {
    } catch (e) {

    }



    // //
    // Future<WeatherRequest> buildWeatherRequest(GetWeatherNowEvent event) async {
    //   return WeatherRequest(
    //       lat: event.lat ?? 51.507336,
    //       lon: event.lon ?? -0.127348,
    //       appId: '36c6afeee531eb6d4daaf6265cc4739d');
    // }

  }
}
