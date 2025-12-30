import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import '../controller/find_donors_controller.dart';
import 'widgets/donor_card.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';
import 'package:rokto/core/common/widgets/address_selector.dart';

class FindDonorsScreen extends ConsumerWidget {
  const FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(findDonorsControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildGlobalAppBar(title: 'Find Donors', context: context),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Column(
            children: [
              SizedBox(height: 20.h),
              // Search Filters
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    AddressSelector(
                      selectedDivision: controller.selectedDivision,
                      selectedDistrict: controller.selectedDistrict,
                      selectedUpazila: controller.selectedUpazila,
                      onDivisionChanged: controller.onDivisionChanged,
                      onDistrictChanged: controller.onDistrictChanged,
                      onUpazilaChanged: controller.onUpazilaChanged,
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton.icon(
                        onPressed: controller.isLoading
                            ? null
                            : () => controller.findDonors(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        icon: controller.isLoading
                            ? Container(
                                width: 24.w,
                                height: 24.h,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Icon(Icons.search),
                        label: Text(
                          controller.isLoading
                              ? "Searching..."
                              : "Search Donors",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              // List
              Expanded(
                child: controller.displayDonors.isEmpty
                    ? Center(
                        child: Text16Normal(
                          text: 'No donors found',
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        itemCount: controller.displayDonors.length,
                        itemBuilder: (context, index) {
                          return DonorCardWidget(
                            donor: controller.displayDonors[index],
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
