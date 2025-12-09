import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/common_widgets/outlined_button.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/utils/apptheme.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo
              // Logo
              Hero(
                tag: 'auth_logo',
                child: SvgPicture.asset(
                  'assets/icons/Logo.svg',
                  color: AppColors.primaryColor,
                  height: 120.h,
                ),
              ),
              SizedBox(height: 10.h),

              // Title "Dare To Donate"
              Hero(
                tag: 'auth_title',
                child: Material(
                  color: Colors.transparent,
                  child: RichText(
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
                            color:
                                AppColors.primaryTextColor, // Black/Dark Grey
                          ),
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

              SizedBox(height: 16.h),

              // Description
              Text(
                'You can donate for ones in need and request blood if you need.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.sp,
                  color: AppColors.secondaryTextColor, // Grey
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Log In Button
              CustomOutlinedButton(
                text: 'LOG IN',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesNames.signIn);
                },
              ),
              SizedBox(height: 16.h),

              // Register Button
              CustomElevatedButton(
                text: 'REGISTER',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesNames.register);
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
