import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class FilterTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const FilterTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text16Normal(
            text: title,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.primaryThirdElementText,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        Divider(
          color: AppColors.primaryThirdElementText.withOpacity(0.2),
          height: 1,
        ),
      ],
    );
  }
}