

import 'package:weather/common/config/default_env.dart';
import 'package:weather/datasource/data/model/request/login_request.dart';
import 'package:weather/datasource/data/model/response/login_response.dart';
import 'package:weather/datasource/network/dio/api_client.dart';

class LoginDataSource {
  final ApiClient apiClient;

  LoginDataSource(this.apiClient);

  Future<LoginResponse> doLogin(LoginParamRequest paramRequest) async {
    final response = await apiClient.post('${DefaultConfig.loginUrl}',
        data: paramRequest.toJson());
    return LoginResponse.fromJson(response);
  }




}
