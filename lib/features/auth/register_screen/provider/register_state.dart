class RegisterState {
  final String name;
  final String email;
  final String password;
  final String phone;
  RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.phone = '',
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
