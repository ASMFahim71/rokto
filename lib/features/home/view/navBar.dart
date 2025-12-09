import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/constants/apptheme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 60.h,
        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(FeatherIcons.home, isActive: true),
                  _buildNavItem(FeatherIcons.search),
                  SizedBox(width: 40.w), // Space for center button
                  _buildNavItem(FeatherIcons.activity),
                  _buildNavItem(FeatherIcons.user),
                ],
              ),
            ),
            Positioned(
              top: -20.h,
              child: Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  FeatherIcons.droplet,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
  Widget _buildNavItem(IconData icon, {bool isActive = false}) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: isActive ? AppTheme.primaryColor : Colors.grey.shade400,
        size: 26.sp,
      ),
    );
  }