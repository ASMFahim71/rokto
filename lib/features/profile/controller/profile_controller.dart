import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/models/profile_stat.dart';
import 'package:rokto/features/profile/repo/profile_repo.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  Future<ProfileStat> build() async {
    final stats = await ProfileRepo.getProfileStats();
    final isAvailable = await ProfileRepo.getAvailability();

    stats.isAvailable = isAvailable;
    return stats;
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
      final serverStatus = await ProfileRepo.toggleStatus(newStatus);
      print("Server returned status: $serverStatus");

      // Update with actual server status
      state = AsyncValue.data(
        ProfileStat(
          donationCount: currentState.donationCount,
          requestCount: currentState.requestCount,
          isAvailable: serverStatus,
        ),
      );

      toastInfo("Status updated");
    } catch (e) {
      print("Toggle failed: $e");
      // Revert on failure
      state = AsyncValue.data(currentState);
      toastInfo("Failed to update status");
    }
  }
}
