import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  bool build() {
    return true; // Default available state
  }

  void toggleAvailable() {
    state = !state;
  }
}
