import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/apptheme.dart';
import '../models/banner_model.dart';

class HomeBannerCarousel extends StatefulWidget {
  final List<BannerModel> banners;

  const HomeBannerCarousel({super.key, required this.banners});

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, realIndex) {
            final banner = widget.banners[index];
            return _buildBannerImage(banner);
          },
          options: CarouselOptions(
            height: 180.h,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            viewportFraction: 0.92,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 16.h),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: widget.banners.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8.w,
            dotHeight: 8.h,
            activeDotColor: AppTheme.primaryColor,
            dotColor: Colors.grey.shade300,
            expansionFactor: 3,
            spacing: 6.w,
          ),
        ),
      ],
    );
  }

  Widget _buildBannerImage(BannerModel banner) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(banner.imageUrl),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.grey[200]);
              },
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.6],
                ),
              ),
            ),

            // Text Content (Optional based on design, but good for accessibility/fallback)
            /*
            Positioned(
              bottom: 16.h,
              left: 16.w,
              right: 16.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    banner.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
