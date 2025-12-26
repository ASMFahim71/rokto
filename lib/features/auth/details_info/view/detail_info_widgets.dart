import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

void showCustomDatePicker({
  required BuildContext context,
  required Function(DateTime) onDateSelected,
  DateTime? initialDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) {
  final now = DateTime.now();

  DateTime tempPickedDate = initialDate ?? now;

  if (maximumDate != null && tempPickedDate.isAfter(maximumDate)) {
    tempPickedDate = maximumDate;
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext builder) {
      return Container(
        height: 300.h,
        padding: EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoButton(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () {
                    onDateSelected(tempPickedDate);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: tempPickedDate,
                minimumDate: minimumDate ?? DateTime(1900),
                maximumDate: maximumDate ?? DateTime(2101),
                onDateTimeChanged: (DateTime newDate) {
                  tempPickedDate = newDate;
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

class SelectionField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T) onChanged;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;
  final VoidCallback onRefresh;

  final IconData? prefixIcon;
  final bool useShadowStyle;

  const SelectionField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
    required this.onRefresh,
    this.prefixIcon,
    this.useShadowStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    // If empty and not loading/error, trigger refresh on tap
    final isEmpty = items.isEmpty && !isLoading && !hasError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            if (isLoading) return;
            if (hasError) {
              onRetry();
              return;
            }
            if (isEmpty) {
              onRefresh();
              return;
            }
            _showSelectionSheet<T>(
              context: context,
              title: 'Select $label',
              items: items,
              selectedValue: value,
              getLabel: getLabel,
              onChanged: onChanged,
            );
          },
          borderRadius: BorderRadius.circular(useShadowStyle ? 8.r : 12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: useShadowStyle
                  ? null
                  : Border.all(
                      color: hasError ? Colors.red : Colors.grey.shade300,
                      width: 1,
                    ),
              borderRadius: BorderRadius.circular(useShadowStyle ? 8.r : 12.r),
              color: Colors.white,
              boxShadow: useShadowStyle
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (prefixIcon != null) ...[
                  Icon(prefixIcon, color: AppColors.primaryColor, size: 20.sp),
                  SizedBox(width: 16.w),
                ],
                Expanded(
                  child: Text(
                    hasError
                        ? 'Error loading $label. Tap to retry.'
                        : (value != null ? getLabel(value!) : label),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hasError
                          ? Colors.red
                          : ((value != null || useShadowStyle)
                                ? (value == null && useShadowStyle
                                      ? AppColors.secondaryTextColor
                                      : AppColors.primaryTextColor)
                                : AppColors.secondaryTextColor),
                      fontWeight: value != null
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                ),
                if (isLoading)
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  Icon(
                    hasError
                        ? Icons.refresh
                        : (isEmpty
                              ? Icons.download
                              : Icons.keyboard_arrow_down),
                    color: hasError ? Colors.red : AppColors.secondaryTextColor,
                    size: 20.sp,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showSelectionSheet<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required T? selectedValue,
    required String Function(T) getLabel,
    required void Function(T) onChanged,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.grey.shade100),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final label = getLabel(item);
                      final isSelected = selectedValue == item;

                      return InkWell(
                        onTap: () {
                          onChanged(item);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.primaryTextColor,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check,
                                  color: AppColors.primaryColor,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

InputDecoration buildInputDecoration(
  String label, {
  Widget? suffixIcon,
  bool alignLabelWithHint = false,
}) {
  return InputDecoration(
    labelText: label,
    hintText: 'Example: Mirpur 10',
    labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.secondaryTextColor),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    suffixIcon: suffixIcon,
    alignLabelWithHint: alignLabelWithHint,
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
  );
}
