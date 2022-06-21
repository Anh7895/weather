import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/common/config/default_env.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  final String baseUrl;
  Dio? dio;

  final List<Interceptor>? interceptors;
  final Map<String, String> headers;

  DioClient({
    required this.headers,
    this.baseUrl = DefaultConfig.baseUrl,
    this.dio,
    this.interceptors,
  }) {
    this.dio = dio ?? Dio();
    this.dio
      ?..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = headers;
    if (interceptors?.isNotEmpty ?? false) {
      this.dio?.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      this.dio?.interceptors.add(LogInterceptor(
          // logPrint: (log) {
          //   debugPrint(log.toString(), wrapWidth: 1024);
          // },
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
    }
  }

  Future<dynamic> get(
    String uri, {
     Map<String, dynamic>? queryParameters,
     Options? options,
     CancelToken? cancelToken,
     ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await this.dio?.get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
      return response?.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await this.dio?.post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
      return response?.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> postGetRes(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await this.dio?.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
     Map<String, dynamic>? queryParameters,
     Options? options,
     CancelToken? cancelToken,
     ProgressCallback? onSendProgress,
     ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await this.dio?.patch(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
      return response?.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
     Map<String, dynamic>? queryParameters,
     Options? options,
     CancelToken? cancelToken,
  }) async {
    try {
      var response = await this.dio?.delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
      return response?.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
     Map<String, dynamic>? queryParameters,
     Options? options,
     CancelToken? cancelToken,
     ProgressCallback? onSendProgress,
     ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await this.dio?.put(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
      return response?.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<File?> download(String url, String savePath) async {
    try {
      var response = await dio?.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return (status ?? 0) < 500;
            }),
      );
      print(response?.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response?.data);
      await raf.close();
      return file;
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

}
