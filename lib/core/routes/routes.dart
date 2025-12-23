import 'package:flutter/material.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/features/auth/auth_landing/auth_landing.dart';
import 'package:rokto/features/auth/details_info/view/detail_info.dart';
import 'package:rokto/features/auth/register_screen/view/register_screen.dart';
import 'package:rokto/features/auth/signin_screen/view/sign_in.dart';
import 'package:rokto/features/home/view/home_view.dart';
import 'package:rokto/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:rokto/features/splash_screen/splash_screen.dart';
import 'package:rokto/features/find_doners/view/find_donors_screen.dart';
import 'package:rokto/features/search_nav_bar/view/widgets/search_screen.dart';
import 'package:rokto/features/donation_request/view/donation_request_screen.dart';
import 'package:rokto/features/report/view/report_screen.dart';
import 'package:rokto/features/profile/view/profile_screen.dart';
import 'package:rokto/features/create_request/view/create_request_screen.dart';

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
      RouteEntity(
        path: AppRoutesNames.findDonors,
        page: const FindDonorsScreen(),
      ),
      RouteEntity(path: AppRoutesNames.search, page: const SearchScreen()),
      RouteEntity(
        path: AppRoutesNames.donationRequest,
        page: const DonationRequestScreen(),
      ),
      RouteEntity(path: AppRoutesNames.report, page: const ReportScreen()),
      RouteEntity(
        path: AppRoutesNames.profileScreen,
        page: const ProfileScreen(),
      ),
      RouteEntity(
        path: AppRoutesNames.createRequest,
        page: const CreateRequestScreen(),
      ),
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
