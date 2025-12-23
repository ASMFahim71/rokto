import 'package:flutter/material.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    fontFamily: 'Poppins',
  );
}
