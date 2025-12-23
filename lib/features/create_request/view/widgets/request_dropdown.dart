import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class RequestDropdown extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const RequestDropdown({
    super.key,
    this.icon,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.primaryColor, size: 20.sp),
            SizedBox(width: 16.w),
          ],
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                hint: Text(
                  hintText,
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14.sp,
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.secondaryTextColor,
                  size: 20.sp,
                ),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
