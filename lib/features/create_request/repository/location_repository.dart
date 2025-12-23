import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_repository.g.dart';

@riverpod
LocationRepository locationRepository(Ref ref) {
  return LocationRepository();
}

class LocationRepository {
  Future<List<String>> getDistricts() async {
    // TODO: Implement API call
    return [];
  }

  Future<List<String>> getThanas(String district) async {
    // TODO: Implement API call
    return [];
  }

  Future<List<String>> getUpazilas(String thana) async {
    // TODO: Implement API call
    return [];
  }
}
