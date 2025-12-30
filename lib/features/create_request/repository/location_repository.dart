import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/features/create_request/model/location_models.dart';

part 'location_repository.g.dart';

@riverpod
LocationRepository locationRepository(Ref ref) {
  return LocationRepository();
}

class LocationRepository {
  Future<List<Division>> getDivisions() async {
    try {
      var response = await HttpUtil().get('/divisions');
      if (response['code'] == 200) {
        List<dynamic> data = response['data'];
        return data.map((json) => Division.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching divisions: $e');
      return [];
    }
  }

  Future<List<District>> getDistricts(String divisionId) async {
    try {
      var response = await HttpUtil().get('/districts/$divisionId');
      if (response['code'] == 200) {
        List<dynamic> data = response['data'];
        return data.map((json) => District.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching districts: $e');
      return [];
    }
  }

  Future<List<Upazila>> getUpazilas(String districtId) async {
    try {
      var response = await HttpUtil().get('/upazilas/$districtId');
      if (response['code'] == 200) {
        List<dynamic> data = response['data'];
        return data.map((json) => Upazila.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching upazilas: $e');
      return [];
    }
  }
}
