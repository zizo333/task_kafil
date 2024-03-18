import 'package:dio/dio.dart';
import 'package:task/core/errors/app_failure.dart';
import 'package:task/core/helpers/app_functions.dart';
import 'package:task/core/helpers/environment.dart';
import 'package:task/core/helpers/typedefs.dart';
import 'package:task/core/networking/api_constants.dart';
import 'package:task/core/networking/network_info.dart';
import 'package:task/core/res/app_strings.dart';

enum RequestType { get, post }

class ApiService {
  ApiService({
    required Dio dio,
    required NetworkInfo networkInfo,
  })  : _dio = dio,
        _networkInfo = networkInfo;

  final Dio _dio;
  final NetworkInfo _networkInfo;

  Future<DataMap> get(
    String path, {
    String? baseUrl,
    DataMap? body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.get,
    );
  }

  Future<DataMap> post(
    String path, {
    String? baseUrl,
    DataMap? body,
    DataMap? queryParameters,
    Map<String, String>? headers,
  }) async {
    return _performRequest(
      path: path,
      baseUrl: baseUrl,
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      type: RequestType.post,
    );
  }

  Future<DataMap> _performRequest({
    required String path,
    required String? baseUrl,
    required DataMap? body,
    required DataMap? queryParameters,
    required Map<String, String>? headers,
    required RequestType type,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        if (baseUrl != null) {
          _dio.options.baseUrl = baseUrl;
        }

        Response<dynamic> response;
        switch (type) {
          case RequestType.get:
            response = await _dio.get<dynamic>(
              path,
              data: body == null ? null : FormData.fromMap(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(
                  headers,
                ),
              ),
            );
          case RequestType.post:
            response = await _dio.post<dynamic>(
              path,
              data: body == null ? null : FormData.fromMap(body),
              queryParameters: queryParameters,
              options: Options(
                headers: ApiConstants.headers(
                  headers,
                ),
              ),
            );
        }
        final data = response.data as DataMap;
        if (data['success'] == true) {
          return response.data as DataMap;
        } else {
          final error = data['error'] as DataMap;
          throw AppFailure(
            message: error['message'] as String,
            code: error['code'] as int,
          );
        }
      } on DioException catch (exception) {
        throw AppFailure(
          message: exception.message ?? AppStrings.unknownError,
          code: exception.response?.statusCode,
        );
      } catch (exception) {
        if (exception is AppFailure) {
          rethrow;
        }
        throw AppFailure(message: exception.toString());
      }
    } else {
      throw const AppFailure(
        message: AppStrings.noInternetError,
      );
    }
  }
}
