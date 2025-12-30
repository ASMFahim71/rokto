import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import '../models/donation_request_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class DonationRequestCard extends StatelessWidget {
  final DonationRequestModel request;
  final VoidCallback onDonate;
  const DonationRequestCard({
    super.key,
    required this.request,
    required this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    print("Blood grop is ${request.bloodGroup}");
    return Container(
      height: 140.h,

      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  'Hospital Name',
                  request.name,
                  fontSize: 16.sp,
                  isBold: true,
                ),
                SizedBox(height: 12.h),
                _buildInfoRow('Location', request.location, fontSize: 13.sp),
                SizedBox(height: 8.h),
                Text(
                  DateFormat('EEE, MMM d, y').format(request.date),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Right Side: Blood Group & Donate Button
          Column(
            children: [
              Container(
                width: 38.w,
                height: 55.h,
                child: Center(
                  child: SvgPicture.asset(
                    _getBloodGroupIcon(request.bloodGroup),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 32.h,
                child: ElevatedButton(
                  onPressed: onDonate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  child: Text(
                    'Donate',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getBloodGroupIcon(int bloodGroup) {
    switch (bloodGroup) {
      case 1:
        return ImageRes.bloodAPlus;
      case 2:
        return ImageRes.bloodAMinus;
      case 3:
        return ImageRes.bloodBPlus;
      case 4:
        return ImageRes.bloodBMinus;
      case 5:
        return ImageRes.bloodABPlus;
      case 6:
        return ImageRes.bloodABMinus;
      case 7:
        return ImageRes.bloodOPlus;
      case 8:
        return ImageRes.bloodOMinus;
      default:
        return ImageRes.bloodBPlus;
    }
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    required double fontSize,
    bool isBold = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: fontSize,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
