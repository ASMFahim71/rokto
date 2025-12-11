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
  Map<String, dynamic>? errors;

  RegisterResponseEntity({this.message, this.token, this.errors});

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      RegisterResponseEntity(
        message: json["message"],
        token: json["token"],
        errors: json["errors"],
      );
}
