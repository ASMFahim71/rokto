import 'package:flutter/material.dart';
import 'package:rokto/core/utils/apptheme.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    // scaffoldBackgroundColor: AppColors.primaryColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    fontFamily: 'Poppins',
  );
}
