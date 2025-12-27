import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/profile_stat.dart';

class ProfileRepo {
  static Future<ProfileStat> getProfileStats() async {
    try {
      var response = await HttpUtil().post('/profile');
      return ProfileStat.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> getAvailability() async {
    try {
      final response = await HttpUtil().post('/profile/status');
      return response['is_available'];
    } catch (e) {
      print("ProfileRepo: getAvailability failed: $e");
      return false; // Default to false on error? Or rethrow?
      // User said "/profile/status will give value for avaibale for donate"
      // Assuming it returns json with is_available
    }
  }

  static Future<bool> toggleStatus(bool isAvailable) async {
    print("ProfileRepo: toggleStatus called with $isAvailable");
    try {
      final response = await HttpUtil().post(
        '/profile/status',
        data: {'is_available': isAvailable},
      );
      print("ProfileRepo: toggleStatus success");
      return response['is_available'];
    } catch (e) {
      print("ProfileRepo: toggleStatus failed: $e");
      throw Exception(e.toString());
    }
  }
}
