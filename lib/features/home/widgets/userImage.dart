import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryElementText,
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage(ImageRes.userImage),
          fit: BoxFit.cover,
        ), // Placeholder profile
      ),
    );
  }
}
