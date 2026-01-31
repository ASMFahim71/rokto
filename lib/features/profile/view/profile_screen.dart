import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:rokto/features/profile/controller/profile_controller.dart';
import 'package:rokto/features/profile/view/widgets/setting_title.dart';
import 'package:rokto/features/profile/view/widgets/stat_card.dart';
import 'package:rokto/features/profile/view/widgets/user_location.dart';
import 'package:rokto/features/profile/view/widgets/last_donate.dart';
import 'package:rokto/core/routes/app_routes_names.dart';
import 'package:rokto/core/common/utils/storage_service.dart';
import 'package:rokto/features/profile/view/widgets/last_donation_date.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileControllerProvider);
    final stats = profileState.asData?.value;
    // Default values if loading or error
    final isAvailable = stats?.isAvailable ?? false;
    final donationCount = stats?.donationCount ?? 0;
    final requestCount = stats?.requestCount ?? 0;

    String userName = StorageService().getUserName() ?? "User";

    return Scaffold(
      appBar: buildAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Profile Image
              Center(
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    userName.isNotEmpty ? userName[0].toUpperCase() : "U",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Name
              text22Normal(text: userName, fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              // Location
              UserLocation(),
              SizedBox(height: 8.h),
              //showing last donate date
              LastDonationDate(),
              SizedBox(height: 10.h),

              SizedBox(height: 20.h),
              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatCard(
                    storageService.getUserBloodGroup() ?? "",
                    "Blood Type",
                  ),
                  buildStatCard(
                    donationCount.toString().padLeft(2, '0'),
                    "Donated",
                  ),
                  buildStatCard(
                    requestCount.toString().padLeft(2, '0'),
                    "Requested",
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Settings List
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    buildSettingsTile(
                      onTap: () {
                        //toastInfo("Not Implemented yet");
                      },
                      image: SvgPicture.asset(
                        ImageRes.calendar,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: "Available for donate",
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: isAvailable,
                          activeColor: AppColors.primaryColor,
                          onChanged: (val) => ref
                              .read(profileControllerProvider.notifier)
                              .toggleAvailable(),
                        ),
                      ),
                      isLast: false,
                    ),
                    SizedBox(height: 10.h),
                    const LastDonateWidget(),
                    SizedBox(height: 10.h),
                    buildSettingsTile(
                      onTap: () {
                        toastInfo("Not Implemented yet");
                      },
                      image: SvgPicture.asset(
                        ImageRes.message,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: "Invite a friend",
                      isLast: false,
                    ),
                    SizedBox(height: 10.h),
                    buildSettingsTile(
                      onTap: () {
                        toastInfo("Not Implemented yet");
                      },
                      image: SvgPicture.asset(
                        ImageRes.help,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: "Get help",
                      isLast: false,
                    ),
                    SizedBox(height: 10.h),
                    buildSettingsTile(
                      onTap: () {
                        AppBox.confirmPopup(
                          context,
                          "Sign Out",
                          "Are you sure you want to sign out?",
                          () {
                            StorageService().removeToken();
                            StorageService().removeUserName();
                            print("Token removed");
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutesNames.signIn,
                              (route) => false,
                            );
                          },
                        );
                      },
                      image: SvgPicture.asset(
                        ImageRes.logout,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: "Sign out",
                      isLast: true,
                      textColor: AppColors.secondaryTextColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
