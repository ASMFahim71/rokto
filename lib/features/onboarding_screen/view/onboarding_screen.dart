import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/utils/apptheme.dart';
import 'package:rokto/features/onboarding_screen/provider/app_nav_screen.dart';
import 'package:rokto/features/onboarding_screen/view/widgets/widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(appNavScreenProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 500.h,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  ref.read(appNavScreenProvider.notifier).setIndex(value);
                },
                children: const [
                  OnboardingPage(
                    imagePath: 'assets/icons/bro.svg',
                    title: 'Find Blood Donors',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu tristique tristique quam in.',
                  ),
                  OnboardingPage(
                    imagePath: 'assets/icons/rafiki.svg',
                    title: 'Post A Blood Request',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu tristique tristique quam in.',
                  ),
                ],
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (dotIndex) {
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 6.w),
                  height: 6.h,
                  width: index == dotIndex ? 30.w : 6.h,
                  decoration: BoxDecoration(
                    color: index == dotIndex
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),

            const Spacer(),

            // Bottom Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      // Navigate to Login/Home
                      Navigator.pushNamed(context, '/auth-landing');
                      debugPrint("Navigate to Login");
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),

                  // Next Button
                  TextButton(
                    onPressed: () {
                      if (index < 1) {
                        _pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushNamed(context, '/auth-landing');
                        debugPrint("Navigate to Login");
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
