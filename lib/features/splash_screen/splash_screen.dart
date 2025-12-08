import 'package:bloodlagbe/core/constants/apptheme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: AppTheme.primaryColor));
  }
}
