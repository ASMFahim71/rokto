import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 120.h,
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
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (dotIndex) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: 6.w),
              height: 5.h,
              width: _activeIndex == dotIndex ? 30.w : 8.h,
              decoration: BoxDecoration(
                color: _activeIndex == dotIndex
                    ? AppColors.primaryColor
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

Widget _buildBannerImage(BannerModel banner) {
  final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  final bannerHeight = 120.h;
  final bannerWidth =
      MediaQuery.of(context).size.width * 0.92; // viewportFraction

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
            image: ResizeImage(
              AssetImage(banner.imageUrl),
              width: (bannerWidth * devicePixelRatio).round(),
              height: (bannerHeight * devicePixelRatio).round(),
            ),
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: Colors.grey.shade200),
          ),

          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.8],
              ),
            ),
          ),

          // Text content
          Positioned(
            left: 16.w,
            bottom: 16.h,
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
                SizedBox(height: 4.h),
                Text(
                  banner.subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
