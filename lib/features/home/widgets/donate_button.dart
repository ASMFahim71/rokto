import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rokto/features/home/models/donation_request_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/features/donation_request/model/order.dart';
    String _formatTime(String time) {
    try {
      final format = DateFormat("HH:mm:ss");
      final dateTime = format.parse(time);
      return DateFormat("h:mm a").format(dateTime);
    } catch (e) {
      try {
        final format = DateFormat("HH:mm");
        final dateTime = format.parse(time);
        return DateFormat("h:mm a").format(dateTime);
      } catch (e) {
        return time;
      }
    }
  }

  Widget _buildPopupRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(fontSize: 14.sp, color: Colors.black87, height: 1.5),
        ),
      ],
    );
  }
void showDonationRequestBottomSheet({
  required BuildContext context,
  required DonationRequestModel request,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.r),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        left: 24.r,
        right: 24.r,
        top: 24.r,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Donation Request",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          _buildPopupRow("Hospital Name", request.name),
          SizedBox(height: 8.h),

          _buildPopupRow("Contact Number", request.phoneNumber),
          SizedBox(height: 8.h),

          _buildPopupRow(
            "Date",
            DateFormat('EEE, MMM d, y').format(request.date),
          ),
          SizedBox(height: 8.h),

          _buildPopupRow("Time", _formatTime(request.time)),
          SizedBox(height: 8.h),

          _buildPopupRow(
            "Location",
            "${request.upazila}, ${request.district}, ${request.division}",
          ),
          SizedBox(height: 8.h),

          _buildPopupRow("Cause", request.description),

          SizedBox(height: 24.h),

          /// Call Button
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton.icon(
              onPressed: () async {
                final Uri uri = Uri(
                  scheme: 'tel',
                  path: request.phoneNumber,
                );

                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Could not launch dialer"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              icon: const Icon(Icons.call),
              label: const Text("Call Now"),
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    ),
  );


}
