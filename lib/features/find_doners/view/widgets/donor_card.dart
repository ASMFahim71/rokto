import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/find_doners/model/donor_model.dart';

class DonorCardWidget extends StatelessWidget {
  final DonorModel donor;

  const DonorCardWidget({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      height: 111.h,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              donor.imageUrl,
              width: 85.w,
              height: 85.h,
              fit: BoxFit.cover,
            ),
          ),
          16.horizontalSpace,

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text16Normal(
                  text: donor.name,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
                4.verticalSpace,
                Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                      height: 16.h,
                      child: Image.asset(ImageRes.mapIcon),
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        donor.location,
                        style: TextStyle(
                          color: AppColors.primaryThirdElementText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Blood Group
          SizedBox(
            width: 35.w,
            height: 50.h,
            child: Center(child: SvgPicture.asset(ImageRes.bloodBPlus)),
          ),
        ],
      ),
    );
  }
}
