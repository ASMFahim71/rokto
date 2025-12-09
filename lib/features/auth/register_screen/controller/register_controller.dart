import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/features/auth/register_screen/provider/register_state.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onNameChange(String name) {
    state = state.copyWith(name: name);
  }

  void onPhoneChange(String phone) {
    state = state.copyWith(phone: phone);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
