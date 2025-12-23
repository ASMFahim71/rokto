import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rokto/core/common/utils/app_color.dart';

toastInfo(
  String str, {
  Color backgroundColor = AppColors.primaryColor,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: str,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
  );
}
