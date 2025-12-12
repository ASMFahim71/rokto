import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageRes.mapIcon, width: 16.w, height: 16.h),
        SizedBox(width: 4.w),
        Text14Normal(
          text: "Dhaka, Bangladesh",
          color: AppColors.secondaryTextColor,
        ),
      ],
    );
  }
}
