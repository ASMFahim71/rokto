import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class BloodGroupSelector extends StatelessWidget {
  final String? selectedBloodGroup;
  final List<String> bloodGroups;
  final ValueChanged<String> onSelected;

  const BloodGroupSelector({
    super.key,
    required this.selectedBloodGroup,
    required this.bloodGroups,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: bloodGroups.map((bg) {
        final isSelected = selectedBloodGroup == bg;
        return GestureDetector(
          onTap: () {
            onSelected(bg);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0xFFF4F5F7),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              bg,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.primaryTextColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
