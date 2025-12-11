class FilterModel {
  final String searchQuery;
  final String? bloodGroup;
  final String? location;
  final String? donorType;
  final String? bloodBank;

  FilterModel({
    this.searchQuery = '',
    this.bloodGroup,
    this.location,
    this.donorType,
    this.bloodBank,
  });

  FilterModel copyWith({
    String? searchQuery,
    String? bloodGroup,
    String? location,
    String? donorType,
    String? bloodBank,
  }) {
    return FilterModel(
      searchQuery: searchQuery ?? this.searchQuery,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      location: location ?? this.location,
      donorType: donorType ?? this.donorType,
      bloodBank: bloodBank ?? this.bloodBank,
    );
  }
}
