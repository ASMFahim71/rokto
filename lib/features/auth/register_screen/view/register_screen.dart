import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common_widgets/apptext_field.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/utils/apptheme.dart';
import 'package:rokto/features/auth/register_screen/controller/register_controller.dart';
import 'package:rokto/features/auth/register_screen/provider/register_notifier.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late RegisterNotifier _controller;
  @override
  void initState() {
    super.initState();
    _controller = RegisterNotifier(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: AppColors.primaryColor,
            size: 30.sp,
          ),
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

              SizedBox(height: 40.h),

              // Form Fields
              AppTextField(
                icon: Icons.person_outline,
                labelText: "Full Name",
                onChanged: (value) => ref
                    .read(registerControllerProvider.notifier)
                    .onNameChange(value),
              ),
              SizedBox(height: 16.h),
              AppTextField(
                icon: Icons.email_outlined,
                labelText: "Email",
                onChanged: (value) => ref
                    .read(registerControllerProvider.notifier)
                    .onEmailChange(value),
              ),
              SizedBox(height: 16.h),
              AppTextField(
                icon: Icons.phone_outlined,
                labelText: "Phone Number",
                onChanged: (value) => ref
                    .read(registerControllerProvider.notifier)
                    .onPhoneChange(value),
              ),
              SizedBox(height: 16.h),
              AppTextField(
                icon: Icons.lock_outline,
                obscureText: true,
                labelText: "Password",
                onChanged: (value) => ref
                    .read(registerControllerProvider.notifier)
                    .onPasswordChange(value),
              ),
              SizedBox(height: 16.h),
              AppTextField(
                icon: Icons.lock,
                obscureText: true,
                labelText: "Confirm Password",
                onChanged: (value) => ref
                    .read(registerControllerProvider.notifier)
                    .onConfirmPasswordChange(value),
              ),

              SizedBox(height: 40.h),

              // Register Button
              CustomElevatedButton(
                text: 'REGISTER',
                isLoading: regProvider.isLoading,
                onPressed: () {
                  _controller.handleRegister();
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
