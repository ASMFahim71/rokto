import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/filter_model.dart';
import '../repo/search_repo.dart';
import 'package:rokto/core/models/address_models.dart';

final searchControllerProvider = Provider.autoDispose(
  (ref) => SearchController(),
);

class SearchController extends ChangeNotifier {
  FilterModel _filters = FilterModel();

  // Getters
  FilterModel get filters => _filters;
  List<String> get availableBloodGroups => SearchRepo.bloodGroups;

  // Actions
  void setSearchQuery(String query) {
    _filters = _filters.copyWith(searchQuery: query);
    notifyListeners();
  }

  void toggleBloodGroup(String bg) {
    if (_filters.bloodGroup == bg) {
      _filters = _filters.copyWith(
        bloodGroup: null,
      ); // Deselect if already selected (handled by passing null? No, copyWith needs nullable logic,
      // but my copyWith logic: bloodGroup: bloodGroup ?? this.bloodGroup.
      // So passing null to copyWith won't set it to null if the logic is `?? this`.
      // I need to fix copyWith logic or pass specific value.
      // Let's assume for now I will fix copyWith to allow clearing.
      // Actually standard copyWith pattern doesn't allow setting null easily unless wrapped.
      // I'll update the model logic slightly in thought or just handle it by creating new instance for now or reassigning.

      // Fixing copyWith logic requires different signature or sentinel.
      // Easier approach: Manually create new filter.
      _filters = FilterModel(
        searchQuery: _filters.searchQuery,
        bloodGroup: null, // cleared
        location: _filters.location,
        donorType: _filters.donorType,
        bloodBank: _filters.bloodBank,
      );
    } else {
      _filters = _filters.copyWith(bloodGroup: bg);
    }
    notifyListeners();
  }

  void setDivision(Division? division) {
    if (_filters.division != division) {
      _filters = _filters.copyWith(
        division: division,
        clearDistrict: true,
        clearUpazila: true,
      );
      notifyListeners();
    }
  }

  void setDistrict(District? district) {
    if (_filters.district != district) {
      _filters = _filters.copyWith(district: district, clearUpazila: true);
      notifyListeners();
    }
  }

  void setUpazila(Upazila? upazila) {
    if (_filters.upazila != upazila) {
      _filters = _filters.copyWith(upazila: upazila);
      notifyListeners();
    }
  }

  void applyFilters() {
    // print('Filters applied: ${_filters.searchQuery}, ${_filters.bloodGroup}');
  }
}
