import 'package:rokto/core/models/address_models.dart';

class FilterModel {
  final String searchQuery;
  final String? bloodGroup;
  final String? location;
  final String? donorType;
  final String? bloodBank;
  final Division? division;
  final District? district;
  final Upazila? upazila;

  FilterModel({
    this.searchQuery = '',
    this.bloodGroup,
    this.location,
    this.donorType,
    this.bloodBank,
    this.division,
    this.district,
    this.upazila,
  });

  FilterModel copyWith({
    String? searchQuery,
    String? bloodGroup,
    String? location,
    String? donorType,
    String? bloodBank,
    Division? division,
    District? district,
    Upazila? upazila,
    bool clearDivision = false,
    bool clearDistrict = false,
    bool clearUpazila = false,
  }) {
    return FilterModel(
      searchQuery: searchQuery ?? this.searchQuery,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      location: location ?? this.location,
      donorType: donorType ?? this.donorType,
      bloodBank: bloodBank ?? this.bloodBank,
      division: clearDivision ? null : (division ?? this.division),
      district: clearDistrict ? null : (district ?? this.district),
      upazila: clearUpazila ? null : (upazila ?? this.upazila),
    );
  }
}
