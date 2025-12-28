import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? rightIcon;

  const CustomNavBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryTextColor,
          size: 20.sp,
        ),
        onPressed: onBackTap ?? () => Navigator.pop(context),
      ),
      title: Text16Normal(
        text: title,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        if (rightIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: rightIcon,
          ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.primaryThirdElementText.withOpacity(0.1),
          height: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}