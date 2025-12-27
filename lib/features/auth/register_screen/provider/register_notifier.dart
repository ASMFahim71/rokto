import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/models/auth_models.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/common/utils/storage_service.dart';
import 'package:rokto/features/auth/register_screen/controller/register_controller.dart';
import 'package:rokto/features/auth/register_screen/repo/register_repo.dart';

class RegisterNotifier {
  late WidgetRef ref;

  RegisterNotifier({required this.ref});

  Future<void> handleRegister() async {
    var state = ref.watch(registerControllerProvider);
    String name = state.name;
    String phone = state.phone;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    print(name);

    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      toastInfo("All fields are required");
      return;
    }
    if (phone.length != 11) {
      toastInfo("Phone number must be 11 digits");
      return;
    }

    if (state.name.length < 6 || name.length < 6) {
      toastInfo("Username must be at least 6 characters long");
      return;
    }
    if (password.length < 8) {
      toastInfo("Password must be at least 8 characters long");
      return;
    }
    if (password != confirmPassword) {
      toastInfo("Password does not match");
      return;
    }

    //passed
    ref.read(registerControllerProvider.notifier).setLoading(true);
    RegisterRequestEntity params = RegisterRequestEntity(
      name: name,
      phone: phone,
      email: email,
      password: confirmPassword,
    );
    try {
      var response = await RegisterRepo.register(params);
      if (response.token != null) {
        await StorageService().setLoggedIn(response.token!);
        await StorageService().setUserName(name);
        print("Token saved: ${StorageService().getUserToken()}");
        print("User Name saved: ${StorageService().getUserName()}");

        toastInfo("Register successfully");
        Navigator.pushNamedAndRemoveUntil(
          ref.context,
          AppRoutesNames.additonalInfo,
          (route) => false,
        );
      } else {
        if (response.errors != null && response.errors!.isNotEmpty) {
          // Extract the first error message from the list of errors
          String errorMsg = "";
          response.errors!.forEach((key, value) {
            if (value is List && value.isNotEmpty) {
              errorMsg += "${value[0]}\n";
            } else {
              errorMsg += "$value\n";
            }
          });
          toastInfo(errorMsg.trim());
        } else {
          toastInfo(response.message ?? "An error occurred");
        }
      }
    } catch (e) {
      toastInfo(e.toString());
    } finally {
      ref.read(registerControllerProvider.notifier).setLoading(false);
    }
  }
}
