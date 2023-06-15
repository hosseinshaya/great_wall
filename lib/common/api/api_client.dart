import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:great_wall/utils/log/log_helper.dart';

import '../../utils/app_directory.dart';
import '../constants/app_config.dart';

class ApiClient {
  factory ApiClient() => _instance;

  ApiClient._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        contentType: 'application/json; charset=utf-8',
        validateStatus: (int? status) => (status ?? 0) <= 500,
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onError: onError,
          onRequest: onRequest,
          onResponse: onResponse,
        ),
      );
    appDirectory().then((Directory dir) => dio.interceptors.add(
          CookieManager(
            PersistCookieJar(
              storage: FileStorage(
                dir.path,
              ),
            ),
          ),
        ));
  }

  late final Dio dio;
  Future<void>? isWorking;

  static final ApiClient _instance = ApiClient._init();

  void onError(DioException error, ErrorInterceptorHandler handler) {
    log(request: error.requestOptions, response: error.response, error: error);
    handler.next(error);
  }

  void onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) {
    log(request: requestOptions);
    handler.next(requestOptions);
  }

  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    log(request: response.requestOptions, response: response);
    handler.next(response);
  }

  void log(
      {RequestOptions? request, Response<dynamic>? response, DioException? error}) {
    Map<String, dynamic> logData = <String, dynamic>{
      if (request != null)
        'request': <String, dynamic>{
          'method': request.method,
          'path': request.path,
          if (request.contentType != 'multipart/form-data')
            'data': request.data,
          'queryParameters': request.queryParameters,
          'headers': request.headers,
        },
      if (response != null)
        'response': <String, dynamic>{
          'data': response.data,
          'statusCode': response.statusCode,
        },
      if (error != null)
        'error': <String, dynamic>{
          'type': error.type.toString(),
          'error': error.error?.toString(),
          'message': error.message,
        },
      'curl': 'curl -X ${request?.method} ${request?.uri}'
    };
    if (error != null) {
      logData.errLog();
    } else {
      logData.infoLog();
    }
  }
}
