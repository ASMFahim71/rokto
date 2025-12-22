import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/core/models/address_models.dart';

class AddressRepo {
  static Future<List<Division>> getDivisions() async {
    try {
      var response = await HttpUtil().post('/divisions');
      print("API Response Divisions: $response");

      if (response == null) return [];

      if (response is List) {
        return response.map((e) => Division.fromJson(e)).toList();
      } else if (response is Map<String, dynamic> &&
          response.containsKey('data')) {
        var data = response['data'];
        if (data is List) {
          return data.map((e) => Division.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Error fetching divisions: $e");
      return [];
    }
  }

  static Future<List<District>> getDistricts(int divisionId) async {
    try {
      var response = await HttpUtil().post('/divisions/$divisionId/districts');
      print("API Response Districts: $response");

      if (response == null) return [];

      if (response is List) {
        return response.map((e) => District.fromJson(e)).toList();
      } else if (response is Map<String, dynamic> &&
          response.containsKey('data')) {
        var data = response['data'];
        if (data is List) {
          return data.map((e) => District.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Error fetching districts: $e");
      return [];
    }
  }

  static Future<List<Upazila>> getUpazilas(int districtId) async {
    try {
      var response = await HttpUtil().post('/districts/$districtId/upazilas');
      print("API Response Upazilas: $response");

      if (response == null) return [];

      if (response is List) {
        return response.map((e) => Upazila.fromJson(e)).toList();
      } else if (response is Map<String, dynamic> &&
          response.containsKey('data')) {
        var data = response['data'];
        if (data is List) {
          return data.map((e) => Upazila.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Error fetching upazilas: $e");
      return [];
    }
  }
}
