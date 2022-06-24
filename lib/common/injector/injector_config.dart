
import 'package:weather/bloc/dashboard/dashboard_bloc.dart';
import 'package:weather/datasource/data/remote/weather_datasource.dart';
import 'package:weather/datasource/network/dio/api_client.dart';
import 'package:weather/datasource/network/dio/dio_client.dart';
import 'package:weather/datasource/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:weather/datasource/repository/weather_repository.dart';



import '../../bloc/home/home_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container?.resolve;

  void _configure() {
    _configureInsuranceModule();
  }

  void _configureInsuranceModule() {
    _configureBlocs();
    _configureRepositories();
    _configureDataSources();
    _configureExternal();
    _configureCommon();
    _configureDio();
  }

  @Register.factory(DashboardBloc)
  @Register.factory(HomeBloc)
  void _configureBlocs();

  @Register.factory(WeatherRepository)
  void _configureRepositories();

  @Register.factory(WeatherDataSource)
  void _configureDataSources();

  @Register.factory(ApiClient)
  void _configureExternal();

  @Register.factory(DioClient)
  void _configureDio();

  @Register.factory(NetworkInfoImpl)
  void _configureCommon();
}
