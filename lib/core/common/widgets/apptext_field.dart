import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class AppTextField extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final Function(String)? onChanged;

  const AppTextField({
    super.key,
    required this.icon,
    this.obscureText = false,
    this.controller,
    this.labelText,
    this.onChanged,
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
              onChanged: onChanged,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryTextColor,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.secondaryTextColor,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
