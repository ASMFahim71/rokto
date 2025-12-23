import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import '../controller/find_donors_controller.dart';
import 'widgets/search_bar.dart';
import 'widgets/filter_button.dart';
import 'widgets/donor_card.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/text_widgets.dart';

class FindDonorsScreen extends ConsumerWidget {
  const FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(findDonorsControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildGlobalAppBar(title: 'Find Donors'),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Column(
            children: [
              SizedBox(height: 20.h,),
              // Top Search and Filter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        onChanged: (query) => controller.searchDonors(query),
                      ),
                    ),
                    16.horizontalSpace,
                    FilterButtonWidget(
                      onTap: () {
                        // Implement filter logic or show dialog
                      },
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              // List
              Expanded(
                child: controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor
                        ),
                      )
                    : controller.displayDonors.isEmpty
                    ? Center(
                        child: Text16Normal(
                          text: 'No donors found',
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
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
