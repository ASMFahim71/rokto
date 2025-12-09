class SigninState {
  final String phone;
  final String password;

  SigninState({this.phone = '', this.password = ''});

  SigninState copyWith({String? phone, String? password}) {
    return SigninState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
