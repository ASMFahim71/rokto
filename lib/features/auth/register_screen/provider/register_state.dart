class RegisterState {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String confirmPassword;
  final bool isLoading;
  RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.confirmPassword = '',
    this.isLoading = false,
  });

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? confirmPassword,
    bool? isLoading,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
