import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/features/auth/signin_screen/provider/signin_state.dart';

part 'siginin_controller.g.dart';

@riverpod
class SigininController extends _$SigininController {
  @override
  SigninState build() {
    return SigninState();
  }

  void onPhoneChange(String phone) {
    state = state.copyWith(phone: phone);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
