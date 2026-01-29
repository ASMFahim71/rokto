import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/storage_service.dart';
import 'package:rokto/features/donation_request/controller/donation_request_controller.dart';
import 'package:rokto/features/home/widgets/donate_button.dart';
import 'package:rokto/features/home/widgets/donation_request_header.dart';
import 'package:rokto/features/home/widgets/grid_menu.dart';
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
    final requests = ref.watch(donationRequestControllerProvider);
    String userName = StorageService().getUserName() ?? "Hero";

    return SafeArea(
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
                      text: userName,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                // const UserImage(),
                Stack(
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      size: 28.w,
                      color: AppColors.primarySecondaryElementText,
                    ),
                    Positioned(
                      right: 2.w,
                      top: 2.h,
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5.w),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 20,
              ), // Added padding for bottom nav
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
                          color: AppColors.primaryColor,
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
                    child: requests.when(
                      data: (requests) {
                        if (requests.isEmpty) {
                          return const Center(
                            child: Text("No donation requests found"),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: min(requests.length, 2),
                          itemBuilder: (context, index) {
                            final request = requests[index];
                            return DonationRequestCard(
                              request: request,
                              onDonate: () {
                                showDonationRequestBottomSheet(
                                  context: context,
                                  request: request,
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      error: (err, stack) => Center(child: Text('Error: $err')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
