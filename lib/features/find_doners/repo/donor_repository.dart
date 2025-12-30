import 'package:rokto/core/common/services/httputil.dart';
import '../model/donor_model.dart';

class DonorRepository {
  Future<List<DonorModel>> findDonors({
    required int divisionId,
    required int districtId,
    required int upazilaId,
    String? bloodGroupId,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'division_id': divisionId,
        'district_id': districtId,
        'upazila_id': upazilaId,
      };
      if (bloodGroupId != null) {
        body['blood_group_id'] = bloodGroupId;
      }

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
}
