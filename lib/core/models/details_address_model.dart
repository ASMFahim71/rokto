import 'dart:convert';

class ProfileUpdateRequestEntity {
  int divisionId;
  int districtId;
  int upazilaId;
  int bloodGroupId;

  ProfileUpdateRequestEntity({
    required this.divisionId,
    required this.districtId,
    required this.upazilaId,
    required this.bloodGroupId,
  });

  Map<String, dynamic> toJson() => {
    "division_id": divisionId,
    "district_id": districtId,
    "upazila_id": upazilaId,
    "blood_group_id": bloodGroupId,
  };
}

class LastDonationUpdateRequestEntity {
  String lastDonateDate;

  LastDonationUpdateRequestEntity({required this.lastDonateDate});

  Map<String, dynamic> toJson() => {"last_donation_date": lastDonateDate};
}

ProfileUpdateResponseEntity profileUpdateResponseEntityFromJson(String str) =>
    ProfileUpdateResponseEntity.fromJson(json.decode(str));

String profileUpdateResponseEntityToJson(ProfileUpdateResponseEntity data) =>
    json.encode(data.toJson());

class ProfileUpdateResponseEntity {
  User user;

  ProfileUpdateResponseEntity({required this.user});

  factory ProfileUpdateResponseEntity.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateResponseEntity(user: User.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {"user": user.toJson()};
}

class User {
  int id;
  String name;
  String email;
  String phone;
  District division;
  District district;
  District upazila;
  BloodGroup bloodGroup;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.division,
    required this.district,
    required this.upazila,
    required this.bloodGroup,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    division: District.fromJson(json["division"]),
    district: District.fromJson(json["district"]),
    upazila: District.fromJson(json["upazila"]),
    bloodGroup: BloodGroup.fromJson(json["blood_group"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "division": division.toJson(),
    "district": district.toJson(),
    "upazila": upazila.toJson(),
    "blood_group": bloodGroup.toJson(),
  };
}

class BloodGroup {
  int id;
  String bloodGroupName;

  BloodGroup({required this.id, required this.bloodGroupName});

  factory BloodGroup.fromJson(Map<String, dynamic> json) =>
      BloodGroup(id: json["id"], bloodGroupName: json["blood_group_name"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "blood_group_name": bloodGroupName,
  };
}

class District {
  int id;
  String name;

  District({required this.id, required this.name});

  factory District.fromJson(Map<String, dynamic> json) =>
      District(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
