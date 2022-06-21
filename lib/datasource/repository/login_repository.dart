import 'package:weather/datasource/network/network_info.dart';
import 'package:weather/common/exceptions/network_connection_exception.dart';
import 'package:weather/datasource/data/model/request/login_request.dart';
import 'package:weather/datasource/data/model/response/login_response.dart';
import 'package:weather/datasource/data/remote/login_datasource.dart';

class LoginRepository {
  final NetworkInfoImpl networkInfo;
  final LoginDataSource loginDataSource;

  LoginRepository(this.loginDataSource, this.networkInfo);


  Future<LoginResponse> requestLogin({LoginParamRequest? request}) async {
    if (await networkInfo.isConnected) {
      return loginDataSource.doLogin(request!);
    } else {
      throw NetworkConnectionException();
    }
  }



}
