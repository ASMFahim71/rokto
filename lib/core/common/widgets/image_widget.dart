import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';

Widget appImagewithColor({
  String imagePath = '',
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement,
}) {
  return Image.asset(imagePath, width: width.w, height: height.h, color: color);
}

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage({
    super.key,
    required this.imagePath,
    this.width = 16,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: width.w, height: height.h);
  }
}
