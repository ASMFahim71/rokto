import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/donation_request/model/order.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyRequestCard extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const MyRequestCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Hospital Name',
                  order.hospitalName ?? "Unknown Hospital",
                  fontSize: 16.sp,
                  isBold: true,
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  'Location',
                  order.place ?? "Unknown Location",
                  fontSize: 13.sp,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      order.date != null
                          ? "${order.date!.day}/${order.date!.month}/${order.date!.year}"
                          : "Unknown Date",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.access_time, size: 12.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      order.time ?? "Unknown Time",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right Side: Blood Group
          Container(
            width: 40.w,
            height: 55.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(_getBloodGroupIcon(order.bloodGroupId)),
          ),
        ],
      ),
    );
  }

  String _getBloodGroupIcon(int? bloodGroupId) {
    switch (bloodGroupId) {
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
