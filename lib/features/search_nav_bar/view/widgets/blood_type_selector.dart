import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class BloodTypeSelector extends StatelessWidget {
  final List<String> bloodGroups;
  final String? selectedBloodGroup;
  final ValueChanged<String> onSelected;

  const BloodTypeSelector({
    super.key,
    required this.bloodGroups,
    this.selectedBloodGroup,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text16Normal(
          text: 'Blood Type',
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.start,
        ),
        initiallyExpanded: true,
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.primarySecondaryElementText,
          size: 24.sp,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: bloodGroups.map((bg) {
                final isSelected = selectedBloodGroup == bg;
                return GestureDetector(
                  onTap: () => onSelected(bg),
                  child: Container(
                    width: 40.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.primaryBackground,
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ), // Capsule shape
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.primaryFourElementText.withOpacity(0.5),
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.3),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: Text14Normal(
                      text: bg,
                      color: isSelected
                          ? Colors.white
                          : AppColors.primaryThirdElementText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Divider(
            color: AppColors.primaryThirdElementText.withOpacity(0.2),
            height: 1,
          ),
        ],
      ),
    );
  }
}
