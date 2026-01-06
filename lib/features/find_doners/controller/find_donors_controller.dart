import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/models/address_models.dart';
import '../model/donor_model.dart';
import '../repo/donor_repository.dart';

final donorRepositoryProvider = Provider((ref) => DonorRepository());

final findDonorsControllerProvider = Provider.autoDispose<FindDonorsController>(
  (ref) {
    final controller = FindDonorsController(ref);
    ref.onDispose(controller.dispose);
    return controller;
  },
);

class FindDonorsController extends ChangeNotifier {
  final Ref ref;

  List<DonorModel> _displayDonors = [];
  bool _isLoading = false;

  // Selection
  Division? _selectedDivision;
  District? _selectedDistrict;
  Upazila? _selectedUpazila;
  String? _selectedBloodGroup;

  FindDonorsController(this.ref) {
    findDonors();
  }

  List<DonorModel> get displayDonors => _displayDonors;
  bool get isLoading => _isLoading;

  Division? get selectedDivision => _selectedDivision;
  District? get selectedDistrict => _selectedDistrict;
  Upazila? get selectedUpazila => _selectedUpazila;
  String? get selectedBloodGroup => _selectedBloodGroup;

  void onDivisionChanged(Division? division) {
    _selectedDivision = division;
    _selectedDistrict = null;
    _selectedUpazila = null;
    notifyListeners();
  }

  void onDistrictChanged(District? district) {
    _selectedDistrict = district;
    _selectedUpazila = null;
    notifyListeners();
  }

  void onUpazilaChanged(Upazila? upazila) {
    _selectedUpazila = upazila;
    notifyListeners();
  }

  void onBloodGroupChanged(String? bloodGroup) {
    _selectedBloodGroup = bloodGroup;
    notifyListeners();
  }

  void clearFilters() {
    _selectedDivision = null;
    _selectedDistrict = null;
    _selectedUpazila = null;
    _selectedBloodGroup = null;
    findDonors();
  }

  Future<void> findDonors() async {
    _isLoading = true;
    notifyListeners();

    final repo = ref.read(donorRepositoryProvider);
    try {
      if (_selectedDivision != null ||
          _selectedDistrict != null ||
          _selectedUpazila != null) {
        _displayDonors = await repo.findDonorsByLocation(
          divisionId: _selectedDivision?.id,
          districtId: _selectedDistrict?.id,
          upazilaId: _selectedUpazila?.id,
          bloodGroupId: _selectedBloodGroup,
        );
      } else {
        _displayDonors = await repo.findDonors(
          divisionId: _selectedDivision?.id,
          districtId: _selectedDistrict?.id,
          upazilaId: _selectedUpazila?.id,
          bloodGroupId: _selectedBloodGroup,
        );
      }
    } catch (e) {
      _displayDonors = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
