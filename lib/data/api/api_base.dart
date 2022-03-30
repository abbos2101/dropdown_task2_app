import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiBase {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://my2.dev.gov.uz/azamat/uz/weather/",
      connectTimeout: 60000,
      sendTimeout: 60000,
      receiveTimeout: 60000,
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //insert onRequest
          debugPrint(
            "***onRequest:***\n"
            "path: ${options.path}\n"
            "data: ${options.data}\n"
            "headers: ${options.headers}",
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          //insert onResponse
          debugPrint(
            "***onResponse:***\n"
            "path: ${response.realUri.path}\n"
            "statusCode: ${response.statusCode}\n"
            "data: ${response.data}",
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          //insert onError
          debugPrint(
            "***onError:***\n"
            "path: ${error.response?.realUri.path}\n"
            "statusCode: ${error.response?.statusCode}\n"
            "message: ${error.message}",
          );
          return handler.next(error);
        },
      ),
    );

  Dio get dio => _dio;
}
