import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/features/auth/register_screen/controller/register_controller.dart';

class RegisterNotifier {
  late WidgetRef ref;

  RegisterNotifier({required this.ref});

  Future<void> handleRegister() async {
    var state = ref.watch(registerControllerProvider);
    String name = state.name;
    String phone = state.phone;
    String email = state.email;
    String password = state.password;
    print(name);
    if (state.name.length < 6 || name.length < 6) {
      toastInfo("Username must be at least 6 characters long");
      return;
    }
  }
}
