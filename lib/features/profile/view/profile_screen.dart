import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:rokto/features/profile/controller/profile_controller.dart';
import 'package:rokto/features/profile/view/widgets/setting_title.dart';
import 'package:rokto/features/profile/view/widgets/stat_card.dart';
import 'package:rokto/features/profile/view/widgets/user_location.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAvailable = ref.watch(profileControllerProvider);

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
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: AssetImage("assets/images/admin.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Name
              text22Normal(text: "Ahsanul Imam", fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              // Location
              UserLocation(),
              SizedBox(height: 24.h),
              // Action Buttons
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                //  color: Colors.amber,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.tealColor, // Teal color from image
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageRes.callIcon,
                              width: 26.w,
                              height: 26.h,
                              color: AppColors.primaryBackground,
                            ),
                            SizedBox(width: 8.w),
                            Text16Normal(
                              text: "Call Now",
                              color: AppColors.primaryBackground,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageRes.requestIcon,
                              width: 26.w,
                              height: 26.h,
                              color: AppColors.primaryBackground,
                            ),
                            SizedBox(width: 8.w),
                            Text16Normal(
                              text: "Request",
                              color: AppColors.primaryBackground,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatCard("A+", "Blood Type"),
                  buildStatCard("05", "Donated"),
                  buildStatCard("02", "Requested"),
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
                        toastInfo("Not Implemented yet");
                      },
                      image: Image.asset(
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
                    buildSettingsTile(
                      onTap: () {
                        toastInfo("Not Implemented yet");
                      },
                      image: Image.asset(
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
                      image: Image.asset(
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
                        toastInfo("Not Implemented yet");
                      },
                      image: Image.asset(
                        ImageRes.logout,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: "Sign out",
                      isLast: true,
                      textColor: AppColors
                          .secondaryTextColor, // Or red? Keeping grey based on image
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
