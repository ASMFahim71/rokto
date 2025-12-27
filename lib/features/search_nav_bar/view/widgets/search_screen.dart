import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/address_selector.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/bloodtype.dart';
import 'package:rokto/core/common/widgets/elevated_button.dart';
import '../../controller/search_controller.dart';
import 'search_input.dart';
import 'filter_section_header.dart';
import 'filter_tile.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(searchControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(title: "Search Blood"),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Search Input
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: SearchInput(onChanged: controller.setSearchQuery),
                ),
            
                // Filter Card
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
            
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 16.h),
                            BloodGroupSelector(
                              selectedBloodGroup: controller.filters.bloodGroup,
                              bloodGroups: controller.availableBloodGroups,
                              onSelected: controller.toggleBloodGroup,
                            ),
                            SizedBox(height: 16.h),
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
            
                      SizedBox(height: 20.h),
            
                      CustomElevatedButton(
                        text: "Apply",
                        onPressed: controller.applyFilters,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
