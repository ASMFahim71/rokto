import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
Widget text24Normal({
  String text = '',
  Color color = AppColors.primaryText,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: TextStyle(color: color, fontSize: 20.sp, fontWeight: fontWeight),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const Text16Normal({
    super.key,
    required this.text,
    required this.color,
    required this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,

      text,
      style: TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  const Text14Normal({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,

      text,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

Widget textUnderline({String text = '', VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.solid,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

class Text12Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight? fontWeight;
  const Text12Normal({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,

      text!,
      style: TextStyle(
        color: color,
        fontSize: 12.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  const Text13Normal({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.start,

      text,
      style: TextStyle(
        color: color,
        fontSize: 13.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const FadeText({
    super.key,
    required this.text,
    this.color = AppColors.primaryElementText,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
