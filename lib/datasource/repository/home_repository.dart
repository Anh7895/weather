import 'package:weather/common/exceptions/network_connection_exception.dart';
import 'package:weather/datasource/data/model/remote/home_data_source.dart';
import 'package:weather/datasource/data/model/request/home_request.dart';
import 'package:weather/datasource/data/model/request/home_request_current.dart';
import 'package:weather/datasource/network/network_info.dart';

class HomeRepository{
  final NetworkInfoImpl networkInfoImpl;
  final HomeDataSource homeDataSource;
  HomeRepository(this.networkInfoImpl, this.homeDataSource);
  Future getWeather(HomeRequest? homeRequest)async{
    if(await networkInfoImpl.isConnected){
      return homeDataSource.getDataHome(homeRequest);
    }else{
      throw NetworkConnectionException();
    }
  }
  Future getCurrentWeather(HomeCurrentRequest? homeCurrentRequest)async{
    if(await networkInfoImpl.isConnected){
      return homeDataSource.getDataCurrentHome(homeCurrentRequest);
    }else{
      throw NetworkConnectionException();
    }
  }
}