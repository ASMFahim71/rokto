import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset('assets/icons/Logo.svg', height: 130.h)
                .animate()
                .fadeIn(duration: 1000.ms, curve: Curves.easeOut)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: 1000.ms,
                  curve: Curves.easeOutExpo, // Smoother, less bouncy
                )
                .shimmer(
                  delay: 2000.ms,
                  duration: 1500.ms,
                  color: Colors.white.withOpacity(0.3),
                ),
            SizedBox(height: 20.h),
            Text(
                  "Dare To Donate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                )
                .animate(
                  onComplete: (controller) {
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingScreen(),
                        ),
                      );
                    }
                  },
                )
                .fadeIn(delay: 800.ms, duration: 800.ms)
                .moveX(
                  begin: 100, // Slide from right
                  end: 0,
                  delay: 800.ms,
                  duration: 800.ms,
                  curve: Curves.easeOutQuart,
                )
                .blur(
                  begin: const Offset(4, 4),
                  end: Offset.zero,
                  delay: 500.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                )
                .shimmer(
                  delay: 1600.ms,
                  duration: 1500.ms,
                  color: Colors.white.withOpacity(0.4),
                  angle: 3.14 / 4,
                ),
          ],
        ),
      ),
    );
  }
}
