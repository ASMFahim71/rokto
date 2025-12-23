import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import '../../../report/model/report_model.dart';
import '../../model/report_state.dart';

class UpdateReportDialog extends StatefulWidget {
  final ReportState currentState;
  final Function(ReportState) onUpdate;

  const UpdateReportDialog({
    super.key,
    required this.currentState,
    required this.onUpdate,
  });

  @override
  State<UpdateReportDialog> createState() => _UpdateReportDialogState();
}

class _UpdateReportDialogState extends State<UpdateReportDialog> {
  late TextEditingController _centerNameController;
  late TextEditingController _locationController;
  late List<TextEditingController> _reportControllers;

  @override
  void initState() {
    super.initState();
    _centerNameController = TextEditingController(
      text: widget.currentState.centerName,
    );
    _locationController = TextEditingController(
      text: widget.currentState.location,
    );
    _reportControllers = widget.currentState.reports
        .map((e) => TextEditingController(text: e.value))
        .toList();
  }

  @override
  void dispose() {
    _centerNameController.dispose();
    _locationController.dispose();
    for (var controller in _reportControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(20.w),
        width: 350.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Update Report",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              SizedBox(height: 20.h),
              _buildTextField("Center Name", _centerNameController),
              SizedBox(height: 12.h),
              _buildTextField("Location", _locationController),
              SizedBox(height: 12.h),
              ...List.generate(widget.currentState.reports.length, (index) {
                final report = widget.currentState.reports[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          report.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.secondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 45.h,
                          child: TextField(
                            controller: _reportControllers[index],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: report.unit,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                  color: AppColors.primaryThirdElementText,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final updatedReports = <ReportModel>[];
                    for (
                      int i = 0;
                      i < widget.currentState.reports.length;
                      i++
                    ) {
                      updatedReports.add(
                        widget.currentState.reports[i].copyWith(
                          value: _reportControllers[i].text,
                        ),
                      );
                    }
                    final updatedState = widget.currentState.copyWith(
                      centerName: _centerNameController.text,
                      location: _locationController.text,
                      reports: updatedReports,
                    );

                    widget.onUpdate(updatedState);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 45.h,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.primaryThirdElementText,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
