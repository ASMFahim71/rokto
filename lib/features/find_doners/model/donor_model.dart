class DonorModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String bloodGroup;
  final String location;
  final String? lastDonationDate;
  final int donationCount;
  final String division;
  final String district;
  final String upazila;

  DonorModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.location,
    this.lastDonationDate,
    required this.donationCount,
    required this.division,
    required this.district,
    required this.upazila,
  });

  factory DonorModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    final bloodGroupObj = json['blood_group'] ?? {};

    // Construct location string with proper comma separation
    List<String> locationParts = [];
    if (user['division'] != null && user['division']['name'] != null) {
      locationParts.add(user['division']['name']);
    }
    if (user['district'] != null && user['district']['name'] != null) {
      locationParts.add(user['district']['name']);
    }
    if (user['upazila'] != null && user['upazila']['name'] != null) {
      locationParts.add(user['upazila']['name']);
    }
    String location = locationParts.join(', ');

    return DonorModel(
      id: json['donor_id'] ?? json['id'] ?? 0,
      name: user['name'] ?? json['user_name'] ?? "Unknown",
      phoneNumber: user['phone'] ?? json['phone'] ?? "Unknown",
      bloodGroup:
          bloodGroupObj['blood_group_name'] ??
          json['blood_group_name'] ??
          "Unknown",
      location: location.isNotEmpty ? location : "Unknown Location",
      lastDonationDate: json['last_donation_date'],
      donationCount: json['donation_count'] ?? 0,
      division: user['division']?['name'] ?? "Unknown",
      district: user['district']?['name'] ?? "Unknown",
      upazila: user['upazila']?['name'] ?? "Unknown",
    );
  }
}
