import 'package:dio/dio.dart';
import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/auth_models.dart';
import 'package:rokto/core/models/details_address_model.dart';

class DetailInfoRepo {
  static Future<ProfileUpdateResponseEntity> updateProfile(
    ProfileUpdateRequestEntity params,
  ) async {
    try {
      var response = await HttpUtil().post(
        '/update-profile',
        data: params.toJson(),
      );
      return ProfileUpdateResponseEntity.fromJson(response);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          var data = e.response!.data as Map<String, dynamic>;
          String msg = data["message"] ?? "Unknown error occurred";
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

  static Future<RegisterResponseEntity> updateLastDonation(
    LastDonationUpdateRequestEntity params,
  ) async {
    try {
      var response = await HttpUtil().post(
        '/update-last-donation',
        data: params.toJson(),
      );
      return RegisterResponseEntity.fromJson(response);
    } on DioException catch (e) {
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
