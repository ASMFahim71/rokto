// To parse this JSON data, do
//
//     final profileStat = profileStatFromJson(jsonString);

import 'dart:convert';

ProfileStat profileStatFromJson(String str) =>
    ProfileStat.fromJson(json.decode(str));

String profileStatToJson(ProfileStat data) => json.encode(data.toJson());

class ProfileStat {
  int donationCount;
  int requestCount;
  bool isAvailable;

  ProfileStat({
    required this.donationCount,
    required this.requestCount,
    required this.isAvailable,
  });

  factory ProfileStat.fromJson(Map<String, dynamic> json) => ProfileStat(
    donationCount: json["donation_count"],
    requestCount: json["request_count"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "donation_count": donationCount,
    "request_count": requestCount,
    "is_available": isAvailable,
  };
}
