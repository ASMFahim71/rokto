import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/models/details_address_model.dart';
import 'package:rokto/features/auth/details_info/repo/detail_info_repo.dart';
import 'package:rokto/core/common/utils/storage_service.dart';

import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:flutter/material.dart';

part 'detail_info_controller.g.dart';

@riverpod
class DetailInfoController extends _$DetailInfoController {
  @override
  bool build() {
    return false; // Loading state
  }

  Future<void> saveDetails({
    required int? divisionId,
    required int? districtId,
    required int? upazilaId,
    required String? bloodGroup,
    required String? lastDonateDate,
    required BuildContext context,
  }) async {
    if (divisionId == null || districtId == null || upazilaId == null) {
      toastInfo("Please select full address");
      return;
    }
    if (bloodGroup == null) {
      toastInfo("Please select blood group");
      return;
    }

    state = true; // Set loading to true

    // Map Blood Group to ID
    int? bloodGroupId = _getBloodGroupId(bloodGroup);

    if (bloodGroupId == null) {
      state = false;
      toastInfo("Invalid Blood Group Selected");
      return;
    }

    try {
      // 1. Update Profile (Address + Blood Group)
      ProfileUpdateRequestEntity profileParams = ProfileUpdateRequestEntity(
        divisionId: divisionId,
        districtId: districtId,
        upazilaId: upazilaId,
        bloodGroupId: bloodGroupId,
      );

      var response = await DetailInfoRepo.updateProfile(profileParams);

      // Save Blood Group and District
      if (response.user.bloodGroup.bloodGroupName.isNotEmpty) {
        await StorageService().setUserBloodGroup(
          response.user.bloodGroup.bloodGroupName,
        );
      }
      if (response.user.district.name.isNotEmpty) {
        await StorageService().setUserDistrict(response.user.district.name);
      }

      // 2. Update Last Donation (if provided)
      if (lastDonateDate != null && lastDonateDate.isNotEmpty) {
        LastDonationUpdateRequestEntity donationParams =
            LastDonationUpdateRequestEntity(lastDonateDate: lastDonateDate);
        var donationResponse = await DetailInfoRepo.updateLastDonation(
          donationParams,
        );

        if (donationResponse.errors != null) {
          state = false;
          toastInfo(donationResponse.message ?? "Last donation update failed");
          return;
        }
      }

      state = false; // Set loading to false
      toastInfo("Profile updated successfully");

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesNames.home,
        (route) => false,
      );
    } catch (e) {
      state = false;
      String msg = e.toString();
      if (msg.startsWith("Exception: ")) {
        msg = msg.substring(11);
      }
      toastInfo(msg);
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
