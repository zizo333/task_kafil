import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/helpers/environment.dart';

class DioFactory {
  const DioFactory._();

  static Future<Dio> getDio() async {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: Environment.baseUrl,
        connectTimeout: AppFunctions.duration2m,
        sendTimeout: AppFunctions.duration2m,
        receiveTimeout: AppFunctions.duration2m,
      );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
