import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/profile_stat.dart';

class ProfileRepo {
  static Future<ProfileStat> getProfileStats() async {
    try {
      var response = await HttpUtil().get('/profile');
      return ProfileStat.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> toggleStatus(bool isAvailable) async {
    print("ProfileRepo: toggleStatus called with $isAvailable");
    try {
      await HttpUtil().post(
        '/profile/status',
        data: {'is_available': isAvailable},
      );
      print("ProfileRepo: toggleStatus success");
    } catch (e) {
      print("ProfileRepo: toggleStatus failed: $e");
      throw Exception(e.toString());
    }
  }
}
