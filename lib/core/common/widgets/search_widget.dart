import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback? func;
  final void Function(String value)? searchFunc;
  const SearchWidget({super.key, this.func, this.searchFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //search box
        Container(
          width: 325.w,
          height: 40.h,
          decoration: appBoxDecoration(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: const AppImage(imagePath: ImageRes.searchIcon),
              ),
              SizedBox(
                width: 285.w,
                height: 40.h,
                child: appTextFieldOnly(
                  search: true,
                  height: 40.h,
                  width: 285.w,
                  hintText: "Search for courses",
                  func: searchFunc,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: func,
          child: Container(
            padding: EdgeInsets.all(5.w),
            width: 40.w,
            height: 40.h,

            decoration: appBoxDecoration(
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: const AppImage(imagePath: ImageRes.searchIcon),
          ),
        ),
      ],
    );
  }
}

BoxDecoration appBoxDecoration({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
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

Widget appTextFieldOnly({
  String? hintText = '',
  double? width = 325,
  double? height = 40,
  TextEditingController? controller,
  void Function(String value)? func,
  bool obsecure = false,
  bool? search = false,
}) {
  return SizedBox(
    width: width!.w,
    height: height!.h,

    child: TextField(
      controller: controller,
      onChanged: search == false ? (value) => func!(value) : null,
      onSubmitted: search == true ? (value) => func!(value) : null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        // hintStyle: TextStylet),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),

        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),

      maxLines: 1,
      autocorrect: false,
      obscureText: obsecure,
    ),
  );
}
