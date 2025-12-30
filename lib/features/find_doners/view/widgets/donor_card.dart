import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/find_doners/model/donor_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorCardWidget extends StatelessWidget {
  final DonorModel donor;

  const DonorCardWidget({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCallDialog(context),
      child: Container(
        width: 374.w,
        // height: 111.h, // Removed fixed height to fit content
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
              child: Container(
                width: 85.w,
                height: 85.h,
                color: AppColors.primaryColor.withOpacity(0.1),
                child: Center(
                  child: Text(
                    donor.name.isNotEmpty ? donor.name[0].toUpperCase() : "?",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
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
                  // Location
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageRes.mapIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: Text(
                          donor.location,
                          style: TextStyle(
                            color: AppColors.primaryThirdElementText,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageRes.phone,
                        height: 16.h,
                        width: 16.w,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: Text(
                          donor.phoneNumber,
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
                  if (donor.lastDonationDate != null) ...[
                    4.verticalSpace,
                    Text(
                      "Last Donation: ${donor.lastDonationDate}",
                      style: TextStyle(
                        color: AppColors.primaryThirdElementText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Blood Group
            SizedBox(
              width: 35.w,
              height: 50.h,
              child: Center(child: _buildBloodGroupIcon(donor.bloodGroup)),
            ),
          ],
        ),
      ),
    );
  }

  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Contact Donor",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                16.verticalSpace,
                Text(
                  "Do you want to call ${donor.name}?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
                8.verticalSpace,
                Text(
                  donor.phoneNumber,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[300]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          final Uri url = Uri.parse("tel:${donor.phoneNumber}");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.call, color: Colors.white),
                            8.horizontalSpace,
                            Text(
                              "Call",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBloodGroupIcon(String bloodGroup) {
    final iconPath = _getBloodGroupIconPath(bloodGroup);
    if (iconPath.endsWith('.svg')) {
      return SvgPicture.asset(iconPath);
    } else {
      return Image.asset(iconPath);
    }
  }

  String _getBloodGroupIconPath(String bloodGroup) {
    switch (bloodGroup) {
      case 'A+':
        return ImageRes.bloodAPlus;
      case 'A-':
        return ImageRes.bloodAMinus;
      case 'B+':
        return ImageRes.bloodBPlus;
      case 'B-':
        return ImageRes.bloodBMinus;
      case 'O+':
        return ImageRes.bloodOPlus;
      case 'O-':
        return ImageRes.bloodOMinus;
      case 'AB+':
        return ImageRes.bloodABPlus;
      case 'AB-':
        return ImageRes.bloodABMinus;
      default:
        return ImageRes.bloodBPlus;
    }
  }
}
