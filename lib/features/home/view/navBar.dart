import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const NavBar({
    super.key,
    this.selectedIndex = 0,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h, // Adjusted to match painter height for alignment
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(double.infinity, 60.h),
            painter: NavBarPainter(),
            child: Container(
              // height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    ImageRes.homeIcon,
                    isActive: selectedIndex == 0,
                    onTap: () => onIndexChanged(0),
                  ),
                  _buildNavItem(
                    ImageRes.searchIcon,
                    isActive: selectedIndex == 1,
                    onTap: () => onIndexChanged(1),
                  ),
                  SizedBox(width: 48.w), // Space for center button
                  _buildNavItem(
                    ImageRes.spike,
                    isActive: selectedIndex == 3,
                    onTap: () => onIndexChanged(3),
                  ),
                  _buildNavItem(
                    ImageRes.profile,
                    isActive: selectedIndex == 4,
                    onTap: () => onIndexChanged(4),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -70.h, // Adjusted to sit perfectly in the notch10
            bottom: 10.h,
            child: GestureDetector(
              onTap: () => onIndexChanged(2),
              child: SizedBox(
                height: 100.h,
                width: 130.w,
                //color: Colors.amber,
                child: SvgPicture.asset(ImageRes.drop),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildNavItem(
  String imagePath, {
  bool isActive = false,
  double? size,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          imagePath,
          height: size ?? 24.h,
          width: size ?? 24.w,
          color: isActive ? AppColors.primaryColor : const Color(0xFF9E9E9E),
        ),
        if (isActive) ...[
          SizedBox(height: 4.h),
          Container(
            width: 4.w,
            height: 4.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ] else ...[
          SizedBox(height: 8.h),
        ],
      ],
    ),
  );
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    Path path = Path();
    double w = size.width;
    double h = size.height;
    double center = w / 2;

    // Config for smooth notch
    double guestRadius = 35.0; // The radius of the hole

    path.moveTo(0, h * 0.4);
    path.quadraticBezierTo(0, 0, 30, 0);

    // Notch Logic
    double r = guestRadius;

    path.lineTo(center - (r * 2), 0);

    // Left curve down
    path.cubicTo(
      center - r - (r * 0.5),
      0,
      center - r - (r * 0.1),
      0,
      center - r,
      r * 0.3,
    );

    // Bottom arc
    path.cubicTo(
      center - r * 0.6,
      r * 1.1, // Control point 1
      center + r * 0.6,
      r * 1.1, // Control point 2
      center + r,
      r * 0.3, // End point
    );

    // Right curve up
    path.cubicTo(
      center + r + (r * 0.1),
      0,
      center + r + (r * 0.5),
      0,
      center + (r * 2),
      0,
    );

    path.lineTo(w - 30, 0);
    path.quadraticBezierTo(w, 0, w, h * 0.4);
    path.lineTo(w, h - 30);
    path.quadraticBezierTo(w, h, w - 30, h);
    path.lineTo(30, h);
    path.quadraticBezierTo(0, h, 0, h - 30);
    path.close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
