import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 374.w,
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
                  'Name',
                  request.name,
                  fontSize: 16.sp,
                  isBold: true,
                ),
                SizedBox(height: 12.h),
                _buildInfoRow('Location', request.location, fontSize: 13.sp),
                SizedBox(height: 8.h),
                Text(
                  request.timeAgo,
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
                    ImageRes.bloodBPlus,
                    
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
