import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/repo/address_repo.dart';

final divisionListProvider = FutureProvider<List<Division>>((ref) async {
  return await AddressRepo.getDivisions();
});

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
