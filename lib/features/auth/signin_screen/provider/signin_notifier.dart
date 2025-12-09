import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/common_widgets/app_popup.dart';
import 'package:rokto/features/auth/signin_screen/controller/siginin_controller.dart';

class SigninNotifier {
  late WidgetRef ref;

  SigninNotifier({required this.ref});

  Future<void> handleRegister() async {
    var state = ref.watch(sigininControllerProvider);
    String phone = state.phone;
    String password = state.password;
    print(phone);

    if (phone.length < 11) {
      toastInfo("Phone number must be at least 11 characters long");
      return;
    }
  }
}
