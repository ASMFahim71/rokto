import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/bloodtype.dart';
import 'package:rokto/core/common/widgets/elevated_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/provider/address_provider.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';

class DetailInfo extends ConsumerStatefulWidget {
  const DetailInfo({super.key});

  @override
  ConsumerState<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends ConsumerState<DetailInfo> {
  Division? selectedDivision;
  District? selectedDistrict;
  Upazila? selectedUpazila;
  String? selectedBloodGroup;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _optionalController = TextEditingController();

  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  void _selectDate(BuildContext context) {
    DateTime tempPickedDate = DateTime.now();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext builder) {
        return Container(
          height: 300.h,
          padding: EdgeInsets.only(top: 6.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _dateController.text = "${tempPickedDate.toLocal()}"
                            .split(' ')[0];
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(1900),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    tempPickedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detailed Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete your profile',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 20.h),

              // Address Section
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              SizedBox(height: 10.h),

              // Division Dropdown
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
                      onRetry: () => ref.refresh(divisionListProvider),
                      onRefresh: () => ref.refresh(divisionListProvider),
                      onChanged: (val) {
                        setState(() {
                          if (selectedDivision != val) {
                            selectedDivision = val;
                            selectedDistrict = null;
                            selectedUpazila = null;
                          }
                        });
                      },
                    ),
                    loading: () => SelectionField<Division>(
                      label: 'Division',
                      value: null,
                      items: [],
                      getLabel: (item) => '',
                      isLoading: true,
                      hasError: false,
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
                        onRetry: () => ref.refresh(
                          districtListProvider(selectedDivision!.id),
                        ),
                        onRefresh: () => ref.refresh(
                          districtListProvider(selectedDivision!.id),
                        ),
                        onChanged: (val) {
                          setState(() {
                            if (selectedDistrict != val) {
                              selectedDistrict = val;
                              selectedUpazila = null;
                            }
                          });
                        },
                      ),
                      loading: () => SelectionField<District>(
                        label: 'District',
                        value: null,
                        items: [],
                        getLabel: (item) => '',
                        isLoading: true,
                        hasError: false,
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
                        onRetry: () => ref.refresh(
                          districtListProvider(selectedDivision!.id),
                        ),
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
                        onRetry: () => ref.refresh(
                          upazilaListProvider(selectedDistrict!.id),
                        ),
                        onRefresh: () => ref.refresh(
                          upazilaListProvider(selectedDistrict!.id),
                        ),
                        onChanged: (val) {
                          setState(() {
                            selectedUpazila = val;
                          });
                        },
                      ),
                      loading: () => SelectionField<Upazila>(
                        label: 'Upazila',
                        value: null,
                        items: [],
                        getLabel: (item) => '',
                        isLoading: true,
                        hasError: false,
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
                        onRetry: () => ref.refresh(
                          upazilaListProvider(selectedDistrict!.id),
                        ),
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
                  onRetry: () {},
                  onRefresh: () {},
                  onChanged: (_) {},
                ),

              SizedBox(height: 24.h),

              // Blood Group
              Text(
                'Blood Group',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              SizedBox(height: 12.h),
              BloodGroupSelector(
                selectedBloodGroup: selectedBloodGroup,
                bloodGroups: bloodGroups,
                onSelected: (val) {
                  setState(() {
                    selectedBloodGroup = val;
                  });
                },
              ),

              SizedBox(height: 24.h),

              // Last Donate Date
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                style: TextStyle(fontSize: 14.sp),
                decoration: buildInputDecoration(
                  'Last Donate Date',
                  suffixIcon: const Icon(
                    Icons.calendar_today,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Optional Details
              TextFormField(
                controller: _optionalController,
                maxLines: 1,
                style: TextStyle(fontSize: 14.sp),
                decoration: buildInputDecoration(
                  'Your Area',
                  alignLabelWithHint: true,
                ),
              ),

              SizedBox(height: 40.h),

              CustomElevatedButton(
                text: 'SAVE & CONTINUE',
                onPressed: () {
                  // Handle Save Logic
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
