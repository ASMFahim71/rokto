import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/address_selector.dart';
import 'package:rokto/core/models/address_models.dart';
import 'package:rokto/features/auth/details_info/provider/address_provider.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';
import 'package:rokto/core/common/widgets/bloodtype.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/elevated_button.dart';
import 'package:rokto/features/create_request/controller/create_request_controller.dart';

import 'package:rokto/features/create_request/view/widgets/request_text_field.dart';

class CreateRequestScreen extends ConsumerStatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  ConsumerState<CreateRequestScreen> createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState extends ConsumerState<CreateRequestScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  String? _selectedBloodGroup;
  String? _selectedGender;

  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  final List<String> _genders = ['Male', 'Female', 'Other'];

  // Location State
  Division? _selectedDivision;
  District? _selectedDistrict;
  Upazila? _selectedUpazila;

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _hospitalController.dispose();
    _causeController.dispose();
    _mobileController.dispose();
    _areaController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);

    showCustomDatePicker(
      context: context,
      minimumDate: startOfToday,
      maximumDate: DateTime(2101),
      onDateSelected: (pickedDate) {
        setState(() {
          _dateController.text =
              "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
        });
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: AppColors.primaryTextColor,
              surface: AppColors.primaryBackground,
            ),
            dialogBackgroundColor: AppColors.primaryBackground,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      if (context.mounted) {
        setState(() {
          _timeController.text = picked.format(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(title: "Create A Request"),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: 120.h,
        ),
        child: Column(
          children: [
            // 1. Choose Blood Section
            Container(
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
                    "Choose Blood",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BloodGroupSelector(
                    selectedBloodGroup: _selectedBloodGroup,
                    bloodGroups: _bloodGroups,
                    onSelected: (val) {
                      setState(() {
                        _selectedBloodGroup = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // 2. Patient & Hospital Info Section
            Container(
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
                    "Patient & Hospital Info",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: RequestTextField(
                              controller: _dateController,
                              hintText: "Date",
                              icon: Icons.calendar_today_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectTime(context),
                          child: AbsorbPointer(
                            child: RequestTextField(
                              controller: _timeController,
                              hintText: "Time",
                              icon: Icons.access_time_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  RequestTextField(
                    controller: _hospitalController,
                    hintText: "Hospital Name",
                    icon: Icons.local_hospital_outlined,
                  ),
                  SizedBox(height: 15.h),
                  RequestTextField(
                    controller: _causeController,
                    hintText: "Cause",
                    icon: Icons.sick_outlined,
                  ),
                  SizedBox(height: 15.h),
                  RequestTextField(
                    controller: _areaController,
                    hintText: "Area (example: Mirpur 10)",
                    icon: Icons.location_on_outlined,
                  ),

                  SizedBox(height: 15.h),
                  RequestTextField(
                    controller: _mobileController,
                    hintText: "Contact Number",
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // 3. Location Section
            AddressSelector(
              title: "Nearest Location of Hospital",
              selectedDivision: _selectedDivision,
              selectedDistrict: _selectedDistrict,
              selectedUpazila: _selectedUpazila,
              onDivisionChanged: (val) {
                setState(() {
                  if (_selectedDivision != val) {
                    _selectedDivision = val;
                    _selectedDistrict = null;
                    _selectedUpazila = null;
                  }
                });
              },
              onDistrictChanged: (val) {
                setState(() {
                  if (_selectedDistrict != val) {
                    _selectedDistrict = val;
                    _selectedUpazila = null;
                  }
                });
              },
              onUpazilaChanged: (val) {
                setState(() {
                  _selectedUpazila = val;
                });
              },
            ),

            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: "Request",
              onPressed: () {
                if (_selectedBloodGroup == null ||
                    _selectedGender == null ||
                    _selectedDivision == null ||
                    _selectedDistrict == null ||
                    _selectedUpazila == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                ref
                    .read(createRequestControllerProvider.notifier)
                    .submitRequest(
                      bloodGroup: _selectedBloodGroup!,
                      date: _dateController.text,
                      time: _timeController.text,
                      hospital: _hospitalController.text,
                      cause: _causeController.text,
                      area: _areaController.text,
                      divisionId: _selectedDivision!.id,
                      districtId: _selectedDistrict!.id,
                      upazilaId: _selectedUpazila!.id,
                      gender: _selectedGender!,
                      mobile: _mobileController.text,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
