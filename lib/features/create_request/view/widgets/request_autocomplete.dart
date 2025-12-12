import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

class RequestAutocomplete extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final List<String> options;
  final Function(String) onSelected;
  final TextEditingController? controller;

  const RequestAutocomplete({
    super.key,
    this.icon,
    required this.hintText,
    required this.options,
    required this.onSelected,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return options.where((String option) {
              return option.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              );
            });
          },
          onSelected: onSelected,
          fieldViewBuilder:
              (
                BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted,
              ) {
                // Sync external controller if provided
                if (controller != null &&
                    controller!.text != fieldTextEditingController.text) {
                  // This prevents infinite loop if we update state elsewhere,
                  // but ideally the parent manages the controller passed to fieldViewBuilder
                  // if we want full control. For simple cases, we just copy initial value.
                  if (controller!.text.isNotEmpty &&
                      fieldTextEditingController.text.isEmpty) {
                    fieldTextEditingController.text = controller!.text;
                  }
                }

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
                        child: TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 14.sp,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
          optionsViewBuilder:
              (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
              ) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Container(
                      width: constraints
                          .maxWidth, // Use the width from LayoutBuilder
                      constraints: BoxConstraints(maxHeight: 200.h),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return ListTile(
                            title: Text(
                              option,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
        );
      },
    );
  }
}
