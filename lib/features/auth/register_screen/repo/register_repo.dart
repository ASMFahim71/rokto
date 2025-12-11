import 'package:dio/dio.dart';
import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/auth_models.dart';

class RegisterRepo {
  static Future<RegisterResponseEntity> register(
    RegisterRequestEntity params,
  ) async {
    try {
      var response = await HttpUtil().post(
        '/register',
        queryParameters: params.toJson(),
      );
      return RegisterResponseEntity.fromJson(response);
    } on DioException catch (e) {
      // Handle DioException to extract backend error message/errors
      if (e.response != null && e.response!.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          return RegisterResponseEntity.fromJson(e.response!.data);
        } else {
          return RegisterResponseEntity(message: e.response!.data.toString());
        }
      }
      return RegisterResponseEntity(
        message: e.message ?? "Unknown error occurred",
      );
    } catch (e) {
      return RegisterResponseEntity(message: e.toString());
    }
  }
}
