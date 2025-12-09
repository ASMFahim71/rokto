import 'package:flutter/material.dart';
import 'package:rokto/core/constants/apptheme.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: AppTheme.primaryColor));
  }
}
