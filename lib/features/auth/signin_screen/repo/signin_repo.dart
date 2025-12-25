import 'package:dio/dio.dart';
import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/auth_models.dart';

class SignInRepo {
  static Future<LoginResponseEntity> signIn(LoginRequestEntity params) async {
    try {
      var response = await HttpUtil().post('/login', data: params.toJson());
      return LoginResponseEntity.fromJson(response);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          var data = e.response!.data as Map<String, dynamic>;
          // Check for 'message' or 'error' key
          String msg = data["message"] ?? "Unknown error occurred";
          if (data.containsKey("errors")) {
            // Optional: Parse errors if needed, but message is usually enough for toast
            // Or you could concat errors.
          }
          throw Exception(msg);
        } else {
          throw Exception(e.response!.data.toString());
        }
      }
      throw Exception(e.message ?? "Unknown error occurred");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
