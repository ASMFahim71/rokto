import 'dart:convert';

class RegisterRequestEntity {
  String name;
  String phone;
  String email;
  String password;

  RegisterRequestEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
  };
}

class RegisterResponseEntity {
  String? message;
  String? token;
  String? username;
  Map<String, dynamic>? errors;

  RegisterResponseEntity({
    this.message,
    this.token,
    this.username,
    this.errors,
  });

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      RegisterResponseEntity(
        message: json["message"],
        token: json["token"],
        username: json["username"],
        errors: json["errors"],
      );
}

class LoginRequestEntity {
  String phone;
  String password;

  LoginRequestEntity({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {"phone": phone, "password": password};
}

LoginResponseEntity loginResponseEntityFromJson(String str) =>
    LoginResponseEntity.fromJson(json.decode(str));

String loginResponseEntityToJson(LoginResponseEntity data) =>
    json.encode(data.toJson());

class LoginResponseEntity {
  User user;
  String token;

  LoginResponseEntity({required this.user, required this.token});

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      LoginResponseEntity(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {"user": user.toJson(), "token": token};
}

class User {
  int id;
  int bloodGroupId;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  dynamic latitude;
  dynamic longitude;
  int divisionId;
  int districtId;
  int upazilaId;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.bloodGroupId,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.divisionId,
    required this.districtId,
    required this.upazilaId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    bloodGroupId: json["blood_group_id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phone: json["phone"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    divisionId: json["division_id"],
    districtId: json["district_id"],
    upazilaId: json["upazila_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "blood_group_id": bloodGroupId,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone": phone,
    "latitude": latitude,
    "longitude": longitude,
    "division_id": divisionId,
    "district_id": districtId,
    "upazila_id": upazilaId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
