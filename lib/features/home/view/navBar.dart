import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 70.h, // Increased height for painter area
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(double.infinity, 60.h),
            painter: NavBarPainter(),
            child: Container(
              height: 60.h,
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
            top: -24.h,
            child: GestureDetector(
              onTap: () => onIndexChanged(2),
              child: Container(
                width: 64.w,
                height: 64.w,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(ImageRes.drop, color: Colors.white),
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
        Image.asset(
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
      ..color = Colors.black.withOpacity(0.05)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    Path path = Path();
    double w = size.width;
    double h = size.height;
    double center = w / 2;
    double curveW = 60.0;

    // Starting point
    path.moveTo(0, h * 0.4); // Start below the curve for top-left

    // Top-Left Corner
    path.quadraticBezierTo(0, 0, 30, 0);

    // Line to start of curve
    path.lineTo(center - curveW, 0);

    // Curve (Notch)
    // Bezier curve to create a dip
    path.cubicTo(
      center - 40,
      0, // Control point 1
      center - 30,
      35, // Control point 2 (Dip depth)
      center,
      35, // End point (Bottom of dip)
    );
    path.cubicTo(
      center + 30,
      35, // Control point 1
      center + 40,
      0, // Control point 2
      center + curveW,
      0, // End point
    );

    // Line to right corner
    path.lineTo(w - 30, 0);

    // Top-Right Corner
    path.quadraticBezierTo(w, 0, w, h * 0.4);

    // Right Side
    path.lineTo(w, h - 30);

    // Bottom-Right Corner
    path.quadraticBezierTo(w, h, w - 30, h);

    // Bottom Side
    path.lineTo(30, h);

    // Bottom-Left Corner
    path.quadraticBezierTo(0, h, 0, h - 30);

    path.close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
