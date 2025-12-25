import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_request_controller.g.dart';

@riverpod
class CreateRequestController extends _$CreateRequestController {
  @override
  void build() {
    return;
  }

  void submitRequest({
    required String bloodGroup,
    required String date,
    required String time,
    required String hospital,
    required String cause,
    required String area,
    required int divisionId,
    required int districtId,
    required int upazilaId,
    required String gender,
    required String mobile,
  }) {
    // TODO: Implement API call
    print(
      "Request Submitted: $bloodGroup, $date, $time, $hospital, $cause, $area, $divisionId, $districtId, $upazilaId, $gender, $mobile",
    );
  }
}
