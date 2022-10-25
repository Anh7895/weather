import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/common/config/default_env.dart';
import 'package:weather/common/utils/preference_utils.dart';
import 'package:weather/datasource/data/model/reponse/home_response.dart';
import 'package:weather/datasource/data/model/reponse/home_response_current.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/data/model/request/home_request_current.dart';
import 'package:weather/datasource/network/dio/api_client.dart';

class HomeDataSource {
  final ApiClient apiClient;

  HomeDataSource(this.apiClient);

  Future<HomeResponse> getDataHome(HomeRequest? homeRequest) async {
      final response =
      await apiClient.get(DefaultConfig.getWeatherNowUrl, queryParameters: {
        'lat': homeRequest?.lat,
        'lon': homeRequest?.lon,
      });


    // if (response['appid'] != null) {
      return HomeResponse.fromJson(response['data']);///  HomeResponse chỉ chứa data
    // } else {
    //   return HomeResponse();
    // }
  }
  // api 2
  Future<HomeResponseCurrent> getDataCurrentHome(HomeCurrentRequest? homeCurrentRequest)async{
    final responseCurrent =
    await apiClient.get(DefaultConfig.getWeatherCurrentNowUrl, queryParameters: {
      'lat': homeCurrentRequest!.lat,
      'lon': homeCurrentRequest.lon,
    });
    return HomeResponseCurrent.fromJson(responseCurrent['data']);
  }
}

