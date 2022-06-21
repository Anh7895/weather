import 'dart:io';
import 'package:weather/common/config/nav_key.dart';
import 'package:weather/datasource/network/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:weather/common/config/default_env.dart';
import 'package:weather/datasource/data/local_user_data.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/preference_utils.dart';
import '../../../ui/home/home_screen.dart';

class ApiClient extends DioClient {
  ApiClient()
      : super(
    baseUrl: DefaultConfig.baseUrl,
    headers: getAuthenticationHeader(),
    interceptors: [
      InterceptorsWrapper(onRequest: (options, handler) {
        print(LocalUserData.getInstance.accessToken);
        print(options.baseUrl);
        print(options.path);
        print(options.headers);
        // Do something before request is sent
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      }, onResponse: (response, handler) {
        print(response.statusCode);
        print(response.data);
        print(response.headers);
        print(response.statusCode);
        // Do something with response data
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      }, onError: (DioError e, handler) async {
        if (e.response?.statusCode == HttpStatus.unauthorized ) {
          LocalUserData.getInstance.accessToken = "";
          await saveToken("");
          Navigator.of(NavKey.navKey.currentContext!).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
        }
        return handler.next(e); //continue
      })
    ]
  );

  static Map<String, String> getAuthenticationHeader() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization':
      //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiI2MTdhNWVmNjE1N2UwMDAwNDMwMDQ0OTIiLCJpYXQiOjE2MzcyMDE5OTAsImV4cCI6MTYzNzQxNzk5MH0.E4SHgpiTCXVrr-YEir7mDyrrtQq8mQsUF6R859VbXnQ',
      'Authorization' :'Bearer ${LocalUserData.getInstance.accessToken}',
      'Accept-Language': '${LocalUserData.getInstance.defaultLanguage}'
    };
  }
}
//Save Token Login
saveToken(String? accessToken) async {
  return await PreferenceUtils.setString("access_token", accessToken ?? "");
}


