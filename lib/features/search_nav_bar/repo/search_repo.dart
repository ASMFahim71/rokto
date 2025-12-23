class SearchRepo {
  static final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  static final List<String> locations = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
  ];

  static final List<String> bloodBanks = [
    'City Blood Bank',
    'Red Cross Center',
    'Hope Blood Bank',
  ];

  static final List<String> donorTypes = ['Individual', 'Organization'];

  // Simulating an API call
  Future<List<String>> fetchLocations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return locations;
  }
}
