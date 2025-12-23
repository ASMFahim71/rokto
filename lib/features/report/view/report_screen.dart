import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/features/report/controller/report_controller.dart';
import 'package:rokto/features/report/view/widgets/report_stat_card.dart';
import 'package:rokto/features/report/view/widgets/update_report_dialog.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState = ref.watch(reportControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildGlobalAppBar(title: "Report"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            // Location Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  reportState.centerName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              reportState.location,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.h),

            // Illustration
            Container(
              padding: EdgeInsets.only(right: 25.w),
              height: 263.23.h,
              width: 275.98.w,
              child: Image.asset(ImageRes.labReport),
            ),

            SizedBox(height: 20.h),

            // Stats Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 0.9,
              ),
              itemCount: reportState.reports.length,
              itemBuilder: (context, index) {
                return ReportStatCard(model: reportState.reports[index]);
              },
            ),

            SizedBox(height: 40.h),

            // My Report Button
            SizedBox(
              width: 200.w,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => UpdateReportDialog(
                      currentState: reportState,
                      onUpdate: (updatedState) {
                        ref
                            .read(reportControllerProvider.notifier)
                            .updateState(updatedState);
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "My Report",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
