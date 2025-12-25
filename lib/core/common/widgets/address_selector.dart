import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/provider/address_provider.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';

class AddressSelector extends ConsumerWidget {
  final Division? selectedDivision;
  final District? selectedDistrict;
  final Upazila? selectedUpazila;
  final Function(Division?) onDivisionChanged;
  final Function(District?) onDistrictChanged;
  final Function(Upazila?) onUpazilaChanged;
  final String title;

  const AddressSelector({
    super.key,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedUpazila,
    required this.onDivisionChanged,
    required this.onDistrictChanged,
    required this.onUpazilaChanged,
    this.title = "Choose your nearest location",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor,
            ),
          ),
          SizedBox(height: 16.h),
          // Division Dropdown
          ref
              .watch(divisionListProvider)
              .when(
                data: (divisions) => SelectionField<Division>(
                  label: 'Division',
                  value: selectedDivision,
                  items: divisions,
                  getLabel: (item) => item.name,
                  isLoading: false,
                  hasError: false,
                  useShadowStyle: false,
                  prefixIcon: Icons.map_outlined,
                  onRetry: () => ref.refresh(divisionListProvider),
                  onRefresh: () => ref.refresh(divisionListProvider),
                  onChanged: onDivisionChanged,
                ),
                loading: () => SelectionField<Division>(
                  label: 'Division',
                  value: null,
                  items: [],
                  getLabel: (item) => '',
                  isLoading: true,
                  hasError: false,
                  useShadowStyle: false,
                  prefixIcon: Icons.map_outlined,
                  onRetry: () {},
                  onRefresh: () {},
                  onChanged: (_) {},
                ),
                error: (err, stack) => SelectionField<Division>(
                  label: 'Division',
                  value: null,
                  items: [],
                  getLabel: (item) => '',
                  isLoading: false,
                  hasError: true,
                  useShadowStyle: false,
                  prefixIcon: Icons.map_outlined,
                  onRetry: () => ref.refresh(divisionListProvider),
                  onRefresh: () {},
                  onChanged: (_) {},
                ),
              ),

          SizedBox(height: 16.h),

          // District Dropdown
          if (selectedDivision != null)
            ref
                .watch(districtListProvider(selectedDivision!.id))
                .when(
                  data: (districts) => SelectionField<District>(
                    label: 'District',
                    value: selectedDistrict,
                    items: districts,
                    getLabel: (item) => item.name,
                    isLoading: false,
                    hasError: false,
                    useShadowStyle: false,
                    prefixIcon: Icons.location_city_outlined,
                    onRetry: () =>
                        ref.refresh(districtListProvider(selectedDivision!.id)),
                    onRefresh: () =>
                        ref.refresh(districtListProvider(selectedDivision!.id)),
                    onChanged: onDistrictChanged,
                  ),
                  loading: () => SelectionField<District>(
                    label: 'District',
                    value: null,
                    items: [],
                    getLabel: (item) => '',
                    isLoading: true,
                    hasError: false,
                    useShadowStyle: false,
                    prefixIcon: Icons.location_city_outlined,
                    onRetry: () {},
                    onRefresh: () {},
                    onChanged: (_) {},
                  ),
                  error: (err, stack) => SelectionField<District>(
                    label: 'District',
                    value: null,
                    items: [],
                    getLabel: (item) => '',
                    isLoading: false,
                    hasError: true,
                    useShadowStyle: false,
                    prefixIcon: Icons.location_city_outlined,
                    onRetry: () =>
                        ref.refresh(districtListProvider(selectedDivision!.id)),
                    onRefresh: () {},
                    onChanged: (_) {},
                  ),
                )
          else
            SelectionField<District>(
              label: 'District',
              value: null,
              items: [],
              getLabel: (item) => '',
              isLoading: false,
              hasError: false,
              useShadowStyle: false,
              prefixIcon: Icons.location_city_outlined,
              onRetry: () {},
              onRefresh: () {},
              onChanged: (_) {},
            ),

          SizedBox(height: 16.h),

          // Upazila Dropdown
          if (selectedDistrict != null)
            ref
                .watch(upazilaListProvider(selectedDistrict!.id))
                .when(
                  data: (upazilas) => SelectionField<Upazila>(
                    label: 'Upazila',
                    value: selectedUpazila,
                    items: upazilas,
                    getLabel: (item) => item.name,
                    isLoading: false,
                    hasError: false,
                    useShadowStyle: false,
                    prefixIcon: Icons.holiday_village_outlined,
                    onRetry: () =>
                        ref.refresh(upazilaListProvider(selectedDistrict!.id)),
                    onRefresh: () =>
                        ref.refresh(upazilaListProvider(selectedDistrict!.id)),
                    onChanged: onUpazilaChanged,
                  ),
                  loading: () => SelectionField<Upazila>(
                    label: 'Upazila',
                    value: null,
                    items: [],
                    getLabel: (item) => '',
                    isLoading: true,
                    hasError: false,
                    useShadowStyle: false,
                    prefixIcon: Icons.holiday_village_outlined,
                    onRetry: () {},
                    onRefresh: () {},
                    onChanged: (_) {},
                  ),
                  error: (err, stack) => SelectionField<Upazila>(
                    label: 'Upazila',
                    value: null,
                    items: [],
                    getLabel: (item) => '',
                    isLoading: false,
                    hasError: true,
                    useShadowStyle: false,
                    prefixIcon: Icons.holiday_village_outlined,
                    onRetry: () =>
                        ref.refresh(upazilaListProvider(selectedDistrict!.id)),
                    onRefresh: () {},
                    onChanged: (_) {},
                  ),
                )
          else
            SelectionField<Upazila>(
              label: 'Upazila',
              value: null,
              items: [],
              getLabel: (item) => '',
              isLoading: false,
              hasError: false,
              useShadowStyle: false,
              prefixIcon: Icons.holiday_village_outlined,
              onRetry: () {},
              onRefresh: () {},
              onChanged: (_) {},
            ),
        ],
      ),
    );
  }
}
