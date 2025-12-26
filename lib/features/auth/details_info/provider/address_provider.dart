import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/repo/address_repo.dart';
import 'dart:async'; // Required for FutureOr

class DivisionNotifier extends AsyncNotifier<List<Division>> {
  @override
  FutureOr<List<Division>> build() {
    return [];
  }

  Future<void> fetchDivisions() async {
    state = await AsyncValue.guard(() => AddressRepo.getDivisions());
  }
}

final divisionListProvider =
    AsyncNotifierProvider<DivisionNotifier, List<Division>>(
      DivisionNotifier.new,
    );

final districtListProvider = FutureProvider.family<List<District>, int>((
  ref,
  divisionId,
) async {
  return await AddressRepo.getDistricts(divisionId);
});

final upazilaListProvider = FutureProvider.family<List<Upazila>, int>((
  ref,
  districtId,
) async {
  return await AddressRepo.getUpazilas(districtId);
});
