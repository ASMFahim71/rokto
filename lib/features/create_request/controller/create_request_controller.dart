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
    required String cause,
    required String district,
    required String thana,
    required String upazila,
    required String gender,
    required String mobile,
  }) {
    // TODO: Implement API call
    print(
      "Request Submitted: $bloodGroup, $date, $time, $cause, $district, $thana, $upazila, $gender, $mobile",
    );
  }
}
