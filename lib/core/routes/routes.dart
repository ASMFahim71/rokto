import 'package:flutter/material.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/features/auth/auth_landing/auth_landing.dart';
import 'package:rokto/features/auth/details_info/view/detail_info.dart';
import 'package:rokto/features/auth/register_screen/view/register_screen.dart';
import 'package:rokto/features/auth/signin_screen/view/sign_in.dart';
import 'package:rokto/features/home/view/home_view.dart';
import 'package:rokto/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:rokto/features/splash_screen/splash_screen.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(
        path: AppRoutesNames.splashScreen,
        page: const SplashScreen(),
      ),
      RouteEntity(
        path: AppRoutesNames.onboardingScreen,
        page: const OnboardingScreen(),
      ),
      RouteEntity(path: AppRoutesNames.authLanding, page: const AuthLanding()),
      RouteEntity(path: AppRoutesNames.signIn, page: const SignInScreen()),
      RouteEntity(path: AppRoutesNames.register, page: const RegisterScreen()),
      RouteEntity(path: AppRoutesNames.additonalInfo, page: const DetailInfo()),
      RouteEntity(path: AppRoutesNames.home, page: const HomeView()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      // bool deviceFirstTime = Global.storageService.getDeviceFirstTime();

      // if (result.first.path == AppRoutersNames.WELCOME && deviceFirstTime) {
      //   bool isLoggedIn = Global.storageService.isLoggedIn();
      //   if (isLoggedIn) {
      //     return MaterialPageRoute(
      //       builder: (_) => const Application(),
      //       settings: settings,
      //     );
      //   }
      //   return MaterialPageRoute(
      //     builder: (_) => const SignInPage(),
      //     settings: settings,
      //   );
      // }
      return MaterialPageRoute(
        builder: (_) => result.first.page,
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: (_) => const OnboardingScreen(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
