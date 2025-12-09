import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common_widgets/apptext_field.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/utils/apptheme.dart';
import 'package:rokto/features/auth/signin_screen/controller/siginin_controller.dart';
import 'package:rokto/features/auth/signin_screen/provider/signin_notifier.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SigninNotifier _controller;
  @override
  void initState() {
    super.initState();
    _controller = SigninNotifier(ref: ref);
  }

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
                        fontFamily: 'Poppins',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'To ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Donate',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 60.h),

              // Form Fields
              AppTextField(
                icon: Icons.phone,
                labelText: 'Phone',
                onChanged: (value) => ref
                    .read(sigininControllerProvider.notifier)
                    .onPhoneChange(value),
              ),
              SizedBox(height: 16.h),
              AppTextField(
                icon: Icons.lock_outline,
                obscureText: true,
                labelText: 'Password',
                onChanged: (value) => ref
                    .read(sigininControllerProvider.notifier)
                    .onPasswordChange(value),
              ),

              SizedBox(height: 40.h),

              // Login Button
              CustomElevatedButton(
                text: 'LOG IN',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesNames.home);
                  _controller.handleRegister();
                },
              ),

              SizedBox(height: 16.h),

              // Forgot Password
              TextButton(
                onPressed: () {},
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
                      recognizer: TapGestureRecognizer()..onTap = () {},
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
