import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/features/create_request/repository/location_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  void build() {
    return;
  }

  Future<List<String>> getDistricts() async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getDistricts();
  }

  Future<List<String>> getThanas(String district) async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getThanas(district);
  }

  Future<List<String>> getUpazilas(String thana) async {
    final repository = ref.read(locationRepositoryProvider);
    return await repository.getUpazilas(thana);
  }
}
