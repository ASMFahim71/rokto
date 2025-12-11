import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/donor_model.dart';
import '../repo/donor_repository.dart';

final donorRepositoryProvider = Provider((ref) => DonorRepository());

final findDonorsControllerProvider = Provider.autoDispose<FindDonorsController>(
  (ref) {
    return FindDonorsController(ref);
  },
);

class FindDonorsController extends ChangeNotifier {
  final Ref ref;

  List<DonorModel> _allDonors = [];
  List<DonorModel> _displayDonors = [];
  bool _isLoading = false;

  FindDonorsController(this.ref) {
    _fetchDonors();
  }

  List<DonorModel> get displayDonors => _displayDonors;
  bool get isLoading => _isLoading;

  Future<void> _fetchDonors() async {
    _isLoading = true;
    // Notify listeners? We are in constructor, maybe not safe synchronously if watched immediately?
    // But since it's async execution inside, it's fine.
    // However, if we notify immediately, we might need microtask.
    // Let's just set initial state values.

    // We should probably notify listeners to show loading if not already.
    // But initial state is false? No, let's set it true initially.
    _isLoading = true;
    // notifyListeners(); // Cannot call in constructor safely if widget is building?
    // Actually, we can just set _isLoading = true by default.

    final repo = ref.read(donorRepositoryProvider);
    try {
      _allDonors = await repo.getDonors();
      _displayDonors = List.from(_allDonors);
    } catch (e) {
      // handle error
      _displayDonors = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchDonors(String query) {
    if (query.isEmpty) {
      _displayDonors = List.from(_allDonors);
    } else {
      _displayDonors = _allDonors.where((donor) {
        return donor.name.toLowerCase().contains(query.toLowerCase()) ||
            donor.location.toLowerCase().contains(query.toLowerCase()) ||
            donor.bloodGroup.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
