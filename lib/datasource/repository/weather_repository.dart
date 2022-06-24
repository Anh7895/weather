import 'package:weather/common/exceptions/network_connection_exception.dart';
import 'package:weather/datasource/data/model/response/weather_model.dart';
import 'package:weather/datasource/network/network_info.dart';

import '../data/model/request/weather_request.dart';
import '../data/remote/weather_datasource.dart';

class WeatherRepository {
  final NetworkInfoImpl networkInfoImpl;
  final WeatherDataSource weatherDataSource;

  WeatherRepository(this.networkInfoImpl, this.weatherDataSource);

  Future<WeatherNowModel> getWeatherNow(WeatherRequest request) async {
    if (await networkInfoImpl.isConnected) {
      return weatherDataSource.getWeatherNow(request);
    } else {
      throw NetworkConnectionException();
    }
  }

}