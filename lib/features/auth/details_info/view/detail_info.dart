import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/address_selector.dart';
import 'package:rokto/core/common/widgets/bloodtype.dart';
import 'package:rokto/core/common/widgets/elevated_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/provider/address_provider.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';
import 'package:rokto/features/auth/details_info/controller/detail_info_controller.dart';

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
    showCustomDatePicker(
      context: context,
      maximumDate: DateTime.now(),
      onDateSelected: (pickedDate) {
        setState(() {
          _dateController.text =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
        });
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
              AddressSelector(
                title: "Address",
                selectedDivision: selectedDivision,
                selectedDistrict: selectedDistrict,
                selectedUpazila: selectedUpazila,
                onDivisionChanged: (val) {
                  setState(() {
                    if (selectedDivision != val) {
                      selectedDivision = val;
                      selectedDistrict = null;
                      selectedUpazila = null;
                    }
                  });
                },
                onDistrictChanged: (val) {
                  setState(() {
                    if (selectedDistrict != val) {
                      selectedDistrict = val;
                      selectedUpazila = null;
                    }
                  });
                },
                onUpazilaChanged: (val) {
                  setState(() {
                    selectedUpazila = val;
                  });
                },
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
                  'Last Donate Date (Optional)',
                  suffixIcon: const Icon(
                    Icons.calendar_today,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Optional Details
              SizedBox(height: 40.h),

              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.watch(detailInfoControllerProvider);
                  return CustomElevatedButton(
                    text: 'SAVE & CONTINUE',
                    isLoading: isLoading,
                    onPressed: () {
                      ref
                          .read(detailInfoControllerProvider.notifier)
                          .saveDetails(
                            divisionId: selectedDivision?.id,
                            districtId: selectedDistrict?.id,
                            upazilaId: selectedUpazila?.id,
                            bloodGroup: selectedBloodGroup,
                            lastDonateDate: _dateController.text,
                            context: context,
                          );
                    },
                  );
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
