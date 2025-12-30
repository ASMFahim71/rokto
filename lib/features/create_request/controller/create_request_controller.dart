import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/features/create_request/repository/create_request_repo.dart';

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
    required String? gender,
    required String mobile,
    required BuildContext context,
  }) async {
    // Map Blood Group to ID
    int? bloodGroupId = _getBloodGroupId(bloodGroup);

    if (bloodGroupId == null) {
      toastInfo("Invalid Blood Group Selected");
      return;
    }

    try {
      print("Sending Request with time: $time");
      var response = await CreateRequestRepo.createBloodRequest(
        bloodGroupId: bloodGroupId,
        divisionId: divisionId,
        districtId: districtId,
        upazilaId: upazilaId,
        date: date,
        time: time,
        hospitalName: hospital,
        contactNumber: mobile,
        cause: cause,
        place: area,
        gender: gender,
      );

      if (response['code'] == 201) {
        toastInfo("Request created successfully");
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutesNames.home,
            (route) => false,
          );
        }
      } else {
        toastInfo(response['message'] ?? "Failed to create request");
      }
    } catch (e) {
      toastInfo("Error: $e");
    }
  }

  int? _getBloodGroupId(String group) {
    switch (group) {
      case 'A+':
        return 1;
      case 'A-':
        return 2;
      case 'B+':
        return 3;
      case 'B-':
        return 4;
      case 'AB+':
        return 5;
      case 'AB-':
        return 6;
      case 'O+':
        return 7;
      case 'O-':
        return 8;
      default:
        return null;
    }
  }
}
