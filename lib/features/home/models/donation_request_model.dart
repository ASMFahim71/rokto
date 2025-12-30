class DonationRequestModel {
  final String name;
  final String location;
  final DateTime date;
  final int bloodGroup;
  final String description;
  final String phoneNumber;
  final String division;
  final String district;
  final String upazila;
  final String time;

  DonationRequestModel({
    required this.name,
    required this.location,
    required this.date,
    required this.bloodGroup,
    required this.description,
    required this.phoneNumber,
    required this.division,
    required this.district,
    required this.upazila,
    required this.time,
  });
}
