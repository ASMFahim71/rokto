import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/donation_request/model/order.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokto/features/my_requests/controller/my_requests_controller.dart';

class MyRequestCard extends ConsumerWidget {
  final Order order;
  final VoidCallback onTap;

  const MyRequestCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    SizedBox(width: 100.w),
                  ],
                ),
              ],
            ),
          ),

          // Right Side: Blood Group and Status
          Column(
            children: [
              Container(
                width: 40.w,
                height: 55.h,
                alignment: Alignment.center,
                child: SvgPicture.asset(_getBloodGroupIcon(order.bloodGroupId)),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  if (order.status != 1) {
                    _showFulfilledConfirmDialog(context, ref, order);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: order.status==1?Colors.green.withOpacity(0.1):Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: order.status==1?Colors.green:Colors.red, width: 1),
                  ),
                  child: Text(
                    _getStatusText(order.status),
                    style: TextStyle(
                      color: _getStatusColor(order.status),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
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

  void _showFulfilledConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    Order order,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Confirm"),
              content: const Text("Fulfilled your request?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // No
                  },
                  child: const Text("No"),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          await ref
                              .read(myRequestsControllerProvider.notifier)
                              .updateStatus(order.id!, 1);
                          if (context.mounted) {
                            Navigator.pop(context); // Yes
                          }
                        },
                  child: isLoading
                      ? SizedBox(
                          width: 16.w,
                          height: 16.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Yes"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getStatusText(int? status) {
    if (status == 1) return "Fulfilled";
    return "Pending";
  }

  Color _getStatusColor(int? status) {
    if (status == 1) return Colors.green;
    return Colors.red;
  }
}
