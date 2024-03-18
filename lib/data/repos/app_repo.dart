import 'package:task/core/errors/app_failure.dart';
import 'package:task/core/helpers/typedefs.dart';
import 'package:task/core/networking/api_result.dart';
import 'package:task/data/datasources/app_remote_data_source.dart';
import 'package:task/data/models/user_type_model.dart';

class AppRepo {
  AppRepo(this._appRemoteDataSource);

  final AppRemoteDataSource _appRemoteDataSource;

  ResultFuture<List<UserTypeModel>> fetchUserTypes() async {
    try {
      final response = await _appRemoteDataSource.fetchUserTypes();
      return ApiResult.success(response);
    } on AppFailure catch (failure) {
      return ApiResult.failure(failure);
    }
  }
}
