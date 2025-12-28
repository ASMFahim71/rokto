import 'package:rokto/core/common/services/httputil.dart';

class CreateRequestRepo {
  static Future<dynamic> createBloodRequest({
    required int bloodGroupId,
    required int divisionId,
    required int districtId,
    required int upazilaId,
    required String date,
    required String time,
    required String hospitalName,
    required String contactNumber,
    required String cause,
    required String place,
    String? gender,
  }) async {
    return await HttpUtil().post(
      '/create-blood-order',
      data: {
        'blood_group_id': bloodGroupId,
        'division_id': divisionId,
        'district_id': districtId,
        'upazila_id': upazilaId,
        'date': date,
        'time': time,
        'hospital_name': hospitalName,
        'contact_number': contactNumber,
        'cause': cause,
        'place': place,
        if (gender != null) 'gender': gender,
      },
    );
  }
}
