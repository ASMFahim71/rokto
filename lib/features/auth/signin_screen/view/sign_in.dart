import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common_widgets/apptext_field.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/utils/apptheme.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              // Header (Logo + Title)
              // Header (Logo + Title)
              Hero(
                tag: 'auth_logo',
                child: SvgPicture.asset(
                  'assets/icons/Logo.svg',
                  color: AppColors.primaryColor,
                  height: 100.h,
                ),
              ),
              SizedBox(height: 20.h),
              Hero(
                tag: 'auth_title',
                child: Material(
                  color: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Dare ',
                      style: TextStyle(
                        fontFamily:
                            'Poppins', // Re-asserting font family just in case
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'To ',
                          style: TextStyle(color: AppColors.primaryTextColor),
                        ),
                        TextSpan(
                          text: 'Donate',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 60.h),

              // Form Fields
              const AppTextField(
                hintText: 'asmfahim@nanitex.com', // Placeholder from design
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: '***********',
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              SizedBox(height: 40.h),

              // Login Button
              CustomElevatedButton(
                text: 'LOG IN',
                onPressed: () {
                  // Handle Login Logic
                },
              ),

              SizedBox(height: 16.h),

              // Forgot Password
              TextButton(
                onPressed: () {
                  // Handle Forgot Password
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(
                height: 100.h,
              ), // Spacer to push bottom text down slightly
              // Don't have an account
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.secondaryTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register Now.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Register
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
