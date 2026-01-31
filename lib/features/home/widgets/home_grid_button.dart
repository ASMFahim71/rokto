import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class HomeGridButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const HomeGridButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50.r),
          child: Container(
           // color: Colors.yellow,
            height:60.h,
            width:60.w,
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,

              ),
            ),
          ),
        ),
       SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            letterSpacing: 0.3,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
