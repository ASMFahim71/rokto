import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/features/search_nav_bar/view/widgets/navbar/custom_nav_bar.dart';
import '../../controller/search_controller.dart';
import 'search_input.dart';
import 'filter_section_header.dart';
import 'blood_type_selector.dart';
import 'filter_tile.dart';
import 'apply_button.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(searchControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildGlobalAppBar(title: "Search"),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Column(
            children: [
              // Search Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SearchInput(onChanged: controller.setSearchQuery),
              ),

              // Filter Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      const FilterSectionHeader(title: 'Filters'),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Blood Type Section
                              BloodTypeSelector(
                                bloodGroups: controller.availableBloodGroups,
                                selectedBloodGroup:
                                    controller.filters.bloodGroup,
                                onSelected: controller.toggleBloodGroup,
                              ),
                              // Other Filters
                              FilterTile(
                                title: 'Location',
                                onTap: () {
                                  // Navigate or expand
                                },
                              ),
                              FilterTile(
                                title: 'Blood Bank',
                                onTap: () {
                                  // Navigate or expand
                                },
                              ),
                              FilterTile(
                                title: 'Donors',
                                onTap: () {
                                  // Navigate or expand
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Apply Button
                      Padding(
                        padding: EdgeInsets.all(20.w),
                        child: ApplyButton(onTap: controller.applyFilters),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
