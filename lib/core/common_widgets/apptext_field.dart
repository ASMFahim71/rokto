import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/utils/apptheme.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8), // Light grey background like design
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          // Icon Section
          SizedBox(
            width: 50.w,
            child: Icon(icon, color: AppColors.primaryColor, size: 20.sp),
          ),

          // Vertical Divider
          Container(width: 1.w, height: 24.h, color: Colors.grey.shade300),

          SizedBox(width: 12.w),

          // Text Field
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryTextColor,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.secondaryTextColor,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
