import 'package:rokto/core/common/services/httputil.dart';
import '../model/donor_model.dart';

class DonorRepository {
  Future<List<DonorModel>> findDonors({
    int? divisionId,
    int? districtId,
    int? upazilaId,
    String? bloodGroupId,
  }) async {
    try {
      final Map<String, dynamic> body = {};

      if (divisionId != null) body['division_id'] = divisionId;
      if (districtId != null) body['district_id'] = districtId;
      if (upazilaId != null) body['upazila_id'] = upazilaId;
      if (bloodGroupId != null) body['blood_group_id'] = bloodGroupId;

      var response = await HttpUtil().post('/find-donors', data: body);

      if (response != null &&
          (response['code'] == 200 || response['status'] == true)) {
        List<dynamic> data = response['data'] ?? [];
        return data.map((json) => DonorModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error finding donors: $e');
      return [];
    }
  }

  Future<List<DonorModel>> findDonorsByLocation({
    int? divisionId,
    int? districtId,
    int? upazilaId,
    String? bloodGroupId,
  }) async {
    try {
      final Map<String, dynamic> body = {};

      if (divisionId != null) body['division_id'] = divisionId;
      if (districtId != null) body['district_id'] = districtId;
      if (upazilaId != null) body['upazila_id'] = upazilaId;
      if (bloodGroupId != null) body['blood_group_id'] = bloodGroupId;

      var response = await HttpUtil().post(
        '/find-donors-by-location',
        data: body,
      );

      if (response != null) {
        if (response is List) {
          return response.map((json) => DonorModel.fromJson(json)).toList();
        } else if (response is Map &&
            (response['code'] == 200 || response['status'] == true)) {
          List<dynamic> data = response['data'] ?? [];
          return data.map((json) => DonorModel.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      print('Error finding donors by location: $e');
      return [];
    }
  }
}
