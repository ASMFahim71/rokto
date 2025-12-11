import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/routes/routes.dart';
import 'package:rokto/core/common/utils/app_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appThemeData,
          initialRoute: AppRoutesNames.splashScreen,
          onGenerateRoute: AppPages.generateRouteSettings,
        );
      },
    );
  }
}
