import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/profile_stat.dart';

class ProfileRepo {
  static bool _parseBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final lower = value.toLowerCase();
      if (lower == 'true' || lower == '1') return true;
      if (lower == 'false' || lower == '0') return false;
    }
    return false;
  }

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
      // Handle various response structures if needed, but assuming standard field
      if (response is Map && response.containsKey('is_available')) {
        return _parseBool(response['is_available']);
      }
      return false;
    } catch (e) {
      print("ProfileRepo: getAvailability failed: $e");
      return false;
    }
  }

  static Future<bool> toggleStatus(bool isAvailable) async {
    print("ProfileRepo: toggleStatus called with $isAvailable");
    try {
      final response = await HttpUtil().post(
        '/profile/status',
        data: {'is_available': isAvailable},
      );
      print("ProfileRepo: toggleStatus success: $response");
      if (response is Map && response.containsKey('is_available')) {
        return _parseBool(response['is_available']);
      }
      // If response is just the boolean or something else, try parsing it directly?
      // But usually it's a JSON object. Fallback to input if ambiguous?
      // Better to return the input `isAvailable` if we can't parse the response,
      // implying success if no error was thrown.
      return isAvailable;
    } catch (e) {
      print("ProfileRepo: toggleStatus failed: $e");
      throw Exception(e.toString());
    }
  }

  static Future<bool> updateLastDonationDate(String date) async {
    try {
      final response = await HttpUtil().post(
        '/profile/last-donate',
        data: {'last_donate': date},
      );
      print("ProfileRepo: updateLastDonationDate success: $response");
      return true;
    } catch (e) {
      print("ProfileRepo: updateLastDonationDate failed: $e");
      throw Exception(e.toString());
    }
  }
}
