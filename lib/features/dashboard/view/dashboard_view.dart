import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/create_request/view/create_request_screen.dart';
import 'package:rokto/features/dashboard/provider/navbarprovider.dart';
import 'package:rokto/features/donation_request/view/donation_request_screen.dart';
import 'package:rokto/features/home/view/home_view.dart';

import 'package:rokto/features/profile/view/profile_screen.dart';
import 'package:rokto/features/search_nav_bar/view/widgets/search_screen.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late final PageController _pageController;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchScreen(),
    const CreateRequestScreen(),
    const DonationRequestScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    ref.read(navbarIndexProvider.notifier).changeIndex(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navbarIndexProvider);

    // Listen to provider changes and update page
    // ref.listen<int>(navbarIndexProvider, (previous, next) {
    //   if (_pageController.hasClients && _pageController.page?.round() != next) {
    //     _pageController.animateToPage(
    //       next,
    //       duration: const Duration(milliseconds: 300),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(navbarIndexProvider.notifier).changeIndex(index);
        },
        children: _screens,
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
        height: 60.h,
        color: Colors.transparent,
        child: CustomPaint(
          size: Size(double.infinity, 70.h),
          painter: NavBarPainter(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(
                  imagePath: -1, // Using indices to map to icons inside
                  iconRes: ImageRes.homeIcon,
                  index: 0,
                  isActive: selectedIndex == 0,
                ),
                _buildNavItem(
                  imagePath: -1,
                  iconRes: ImageRes.searchIcon,
                  index: 1,
                  isActive: selectedIndex == 1,
                ),
                SizedBox(width: 45.w), // Space for FAB
                _buildNavItem(
                  imagePath: -1,
                  // Using ImageRes.spike as per original code for 4th item
                  iconRes: ImageRes.spike,
                  index: 3,
                  isActive: selectedIndex == 3,
                ),
                _buildNavItem(
                  imagePath: -1,
                  iconRes: ImageRes.profile,
                  index: 4,
                  isActive: selectedIndex == 4,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Container(
        width: 60.w, // Slightly larger base
        height: 60.w,
        margin: EdgeInsets.only(
          bottom: 13.h,
        ), // Adjust vertical alignment if needed
        child: FloatingActionButton(
          tooltip: 'Create Request',
          onPressed: () => _onItemTapped(2),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide(color: Colors.white, width: 4.w),
          ),
          child: SvgPicture.asset(
            ImageRes.drop3,
            width: 30.w,
            height: 30.w,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }

  Widget _buildNavItem({
    required int
    imagePath, // Just to satisfy signature if keeping, but I changed usage
    required String iconRes,
    required int index,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconRes,
            height: 24.h,
            width: 24.w,
            color: isActive ? AppColors.primaryColor : const Color(0xFF9E9E9E),
          ),
          if (isActive)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Container(
                width: 4.w,
                height: 4.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            SizedBox(height: 8.h),
        ],
      ),
    );
  }
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
    double guestRadius = 35.0;

    // Start with top edge, accounting for rounded corners
    double cornerRadius = 30.0; // r

    path.moveTo(0, h * 0.4);
    path.quadraticBezierTo(0, 0, cornerRadius, 0); // Top-left corner

    // Line to Notch Start
    double r = guestRadius;
    path.lineTo(center - (r * 2), 0);

    // Notch Logic using cubic curves for smoothness
    path.cubicTo(
      center - r - (r * 0.5),
      0,
      center - r - (r * 0.1),
      0,
      center - r,
      r * 0.3,
    );

    path.cubicTo(
      center - r * 0.6,
      r * 1.1, // Control point deep
      center + r * 0.6,
      r * 1.1, // Control point deep
      center + r,
      r * 0.3, // End point up
    );

    path.cubicTo(
      center + r + (r * 0.1),
      0,
      center + r + (r * 0.5),
      0,
      center + (r * 2),
      0,
    );

    // Top-right corner
    path.lineTo(w - cornerRadius, 0);
    path.quadraticBezierTo(w, 0, w, h * 0.4);

    // Bottom-right corner
    path.lineTo(w, h - cornerRadius);
    path.quadraticBezierTo(w, h, w - cornerRadius, h);

    // Bottom-left corner
    path.lineTo(cornerRadius, h);
    path.quadraticBezierTo(0, h, 0, h - cornerRadius);

    path.close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
