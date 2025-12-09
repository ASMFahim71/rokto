import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/features/home/view/navBar.dart';
import 'package:rokto/features/home/view/userImage.dart';
import 'package:rokto/features/home/widgets/donation_request_header.dart';
import 'package:rokto/features/home/widgets/grid_menu.dart';
import '../../../core/constants/apptheme.dart';
import '../controller/home_controller.dart';
import '../widgets/home_banner_carousel.dart';
import '../widgets/donation_request_card.dart'; 
import '../../../core/common/widgets/text_widgets.dart';
import '../../../core/common/utils/app_color.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannersAsync = ref.watch(bannerProvider);
    final donationRequestAsync = ref.watch(donationRequestProvider);

    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text14Normal(
                        text: 'Hello Real Hero!',
                        color: AppColors.primaryThirdElementText,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 4.h),
                      text24Normal(
                        text:'Ahsanul', // Placeholder or use user name
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const UserImage(),
                  ],
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    // 1. Banner Carousel
                    bannersAsync.when(
                      data: (banners) => HomeBannerCarousel(banners: banners),
                      loading: () => SizedBox(
                        height: 180.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                      error: (err, stack) => SizedBox(
                        height: 180.h,
                        child: const Center(
                          child: Text('Failed to load banners'),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),
                    // 2. Grid Menu
                    const GridMenu(),
                    SizedBox(height: 32.h),
                    // 3. Donation Request Header
                    const DonationRequestHeader(),  
                    SizedBox(height: 16.h),
                    // 4. Donation Request Card
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: donationRequestAsync.when(
                        data: (request) => DonationRequestCard(
                          request: request,
                          onDonate: () {},
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        error: (err, stack) =>
                            const Text('Error loading request'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const NavBar(),
    );
  }
}
