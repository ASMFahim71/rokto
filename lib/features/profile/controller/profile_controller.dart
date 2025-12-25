import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/models/profile_stat.dart';
import 'package:rokto/features/profile/repo/profile_repo.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  Future<ProfileStat> build() async {
    return await ProfileRepo.getProfileStats();
  }

  Future<void> toggleAvailable() async {
    print("toggleAvailable called");
    final currentState = state.value;
    if (currentState == null) {
      print("currentState is null");
      return;
    }

    final newStatus = !currentState.isAvailable;
    print("Toggling to: $newStatus");

    // Optimistic Update
    state = AsyncValue.data(
      ProfileStat(
        donationCount: currentState.donationCount,
        requestCount: currentState.requestCount,
        isAvailable: newStatus,
      ),
    );

    try {
      await ProfileRepo.toggleStatus(newStatus);
      toastInfo("Status updated");
    } catch (e) {
      print("Toggle failed: $e");
      // Revert on failure
      state = AsyncValue.data(currentState);
      toastInfo("Failed to update status");
    }
  }
}
