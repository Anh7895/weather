import 'package:dio/dio.dart';

abstract class BaseState {}

class StartCallApiState extends BaseState {}

abstract class ApiSuccessState extends BaseState {}

class ApiErrorState extends BaseState {
  final String? errorMessage;
  final String? errorCode;
  final String? errorDescription;
  final Object? error;

  ApiErrorState({this.errorMessage, this.errorCode, this.errorDescription, this.error});
}

class ApiTokenExpired extends BaseState{
  final DioError? dioError;

  ApiTokenExpired({this.dioError});


}

class HideLoadingState extends BaseState {
  HideLoadingState();
}
