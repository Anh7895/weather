import 'package:weather/common/config/default_env.dart';
import 'package:weather/datasource/data/model/reponse/home_response.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/network/dio/api_client.dart';

class HomeDataSource {
  final ApiClient apiClient;

  HomeDataSource(this.apiClient);

  Future<HomeResponse> getDataHome(HomeRequest? homeRequest) async {
    final response =
        await apiClient.get(DefaultConfig.getWeatherNowUrl, queryParameters: {
      'appid': homeRequest!.appid, // appid chắc chắn khác null
      'lat': homeRequest.lat,
      'lon': homeRequest.lon,
    });

    // if (response['appid'] != null) {
      return HomeResponse.fromJson(response);
    // } else {
    //   return HomeResponse();
    // }
  }
}
