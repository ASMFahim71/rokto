import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/features/find_doners/view/widgets/search_bar.dart';
import 'package:rokto/features/search_nav_bar/view/widgets/search_input.dart';
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
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        onChanged: (value) {
                          // Implement client-side filtering or name search if API supports
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    GestureDetector(
                      onTap: () => _showFilterBottomSheet(context, controller),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              // List
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.displayDonors.isEmpty
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

  void _showFilterBottomSheet(
    BuildContext context,
    FindDonorsController controller,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Filter Donors",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  20.verticalSpace,
                  AddressSelector(
                    selectedDivision: controller.selectedDivision,
                    selectedDistrict: controller.selectedDistrict,
                    selectedUpazila: controller.selectedUpazila,
                    onDivisionChanged: controller.onDivisionChanged,
                    onDistrictChanged: controller.onDistrictChanged,
                    onUpazilaChanged: controller.onUpazilaChanged,
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            controller.clearFilters();
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.findDonors();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            "Apply Filters",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
