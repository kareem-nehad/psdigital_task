import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptor extends Interceptor {
  const AppInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      'REQUEST[${options.method}] => PATH: ${options.path} \n '
      'BODY: ${options.data} \n '
      'HEADERS: ${options.headers} \n '
      'QUERY: ${options.queryParameters} \n '
      'URL: ${options.uri.toString()} \n',
    );

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} \n'
      'ERROR MESSAGE: ${err.message} \n'
      'ERROR RESPONSE: ${err.response} \n',
    );
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} \n '
      'DATA: ${response.data} \n ',
    );
    super.onResponse(response, handler);
  }
}
