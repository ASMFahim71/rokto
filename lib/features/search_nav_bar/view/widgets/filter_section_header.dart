import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class FilterSectionHeader extends StatelessWidget {
  final String title;

  const FilterSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(
            child: Text16Normal(
              text: title,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(
          color: AppColors.primaryThirdElementText.withOpacity(0.2),
          height: 1,
        ),
      ],
    );
  }
}
