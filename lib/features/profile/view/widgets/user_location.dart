import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/utils/storage_service.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageRes.mapIcon,
          height: 16.h,
          width: 16.w,
        ),
        SizedBox(width: 4.w),
        Text14Normal(
          text: "${storageService.getUserDistrict() ?? ""}, Bangladesh",
          color: AppColors.secondaryTextColor,
        ),
      ],
    );
  }
}
