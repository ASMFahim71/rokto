import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common_widgets/apptext_field.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/utils/apptheme.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
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
                        fontFamily: 'Poppins',
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

              SizedBox(height: 40.h),

              // Form Fields
              const AppTextField(
                hintText: 'ASM FAHIM',
                icon: Icons.person_outline,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: 'asmfahim@nanitex.com',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: '***********',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: '+8801722222222',
                icon: Icons.phone_outlined,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: 'O+',
                icon: Icons.bloodtype_outlined,
              ),
              SizedBox(height: 16.h),
              const AppTextField(
                hintText: 'Chittagong, BD.',
                icon: Icons.location_on_outlined,
              ),

              SizedBox(height: 40.h),

              // Register Button
              CustomElevatedButton(
                text: 'REGISTER',
                onPressed: () {
                  // Handle Register Logic
                },
              ),

              SizedBox(height: 40.h),

              // Already have an account
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    color: AppColors.secondaryTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'Log In.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutesNames.signIn,
                          );
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
