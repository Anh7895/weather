import 'package:weather/common/config/default_env.dart';
import 'package:weather/datasource/data/model/response/weather_model.dart';
import 'package:weather/datasource/network/dio/api_client.dart';

import '../model/request/weather_request.dart';

class WeatherDataSource {
  final ApiClient apiClient;

  WeatherDataSource(this.apiClient);

  Future<WeatherNowModel> getWeatherNow(WeatherRequest request) async {
    final response =
    await apiClient.get(DefaultConfig.getWeatherNowUrl,queryParameters: {'lat':request.lat,'lon':request.lon,'appid':request.appId});
    return WeatherNowModel.fromJson(response);
  }
}
