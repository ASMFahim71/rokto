import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({String title = ''}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.primaryBackground,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primaryThirdElementText.withOpacity(0.2),
        height: 1,
      ),
    ),
    centerTitle: true,
    title: Text16Normal(
      text: title,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.bold,
    ),
  );
}

AppBar buildGlobalAppBar({
  String title = '',
  required BuildContext context,
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: Text16Normal(
      text: title,
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.bold,
    ),
    leading: showBackButton
        ? IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: AppColors.primaryColor,
              size: 30.sp,
            ),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    scrolledUnderElevation: 0,
  );
}
