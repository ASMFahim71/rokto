import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/features/create_request/repository/location_repository.dart';
import 'package:rokto/features/create_request/model/location_models.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  void build() {
    return;
  }

  Future<List<Division>> getDivisions() async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getDivisions();
  }

  Future<List<District>> getDistricts(String divisionId) async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getDistricts(divisionId);
  }

  Future<List<Upazila>> getUpazilas(String districtId) async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getUpazilas(districtId);
  }
}
