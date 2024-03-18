import 'package:task/core/helpers/typedefs.dart';
import 'package:task/core/networking/api_constants.dart';
import 'package:task/core/networking/api_service.dart';
import 'package:task/data/models/user_type_model.dart';

class AppRemoteDataSource {
  AppRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<UserTypeModel>> fetchUserTypes() async {
    try {
      final response = await _apiService.get(
        ApiConstants.appDependencies,
      );
      return List<UserTypeModel>.from(
        ((response['data'] as DataMap)['types'] as List)
            .map((type) => UserTypeModel.fromMap(type as DataMap)),
      );
    } on Exception {
      rethrow;
    }
  }
}
