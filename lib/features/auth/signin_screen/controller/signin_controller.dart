import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/core/common/utils/storage_service.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/models/auth_models.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/features/auth/signin_screen/repo/signin_repo.dart';

part 'signin_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  bool build() {
    return false; // Loading state
  }

  Future<void> handleSignIn({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    if (phone.isEmpty || password.isEmpty) {
      toastInfo("Please fill all fields");
      return;
    }

    state = true; // Loading = true

    LoginRequestEntity params = LoginRequestEntity(
      phone: phone,
      password: password,
    );

    try {
      var response = await SignInRepo.signIn(params);

      print("Token: ${response.token} Name: ${response.user.name}");

      if (response.token.isNotEmpty) {
        await StorageService().setLoggedIn(response.token);
        await StorageService().setUserName(response.user.name);
        print("Username saved: ${StorageService().getUserName()}");

        toastInfo("Login successful");
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutesNames.home,
          (route) => false,
        );
      } else {
        toastInfo("Login failed: Empty token");
      }
    } catch (e) {
      String msg = e.toString();
      if (msg.startsWith("Exception: ")) {
        msg = msg.substring(11);
      }
      toastInfo(msg);
    } finally {
      state = false; // Loading = false
    }
  }
}
