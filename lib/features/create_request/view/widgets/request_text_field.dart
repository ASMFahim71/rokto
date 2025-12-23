import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class RequestTextField extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;

  const RequestTextField({
    super.key,
    this.icon,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
  });

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: maxLines > 1 ? 12.h : 0,
      ),
      child: Row(
        crossAxisAlignment: maxLines > 1
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.primaryColor, size: 20.sp),
            SizedBox(width: 16.w),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: maxLines > 1
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(vertical: 16.h),
              ),
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
