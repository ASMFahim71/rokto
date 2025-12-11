import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common_widgets/elevated_button.dart';
import 'package:rokto/core/utils/apptheme.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedUpazila;
  String? selectedBloodGroup;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _optionalController = TextEditingController();

  final List<String> divisions = [
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Khulna',
    'Barisal',
    'Sylhet',
    'Rangpur',
    'Mymensingh',
  ];
  final List<String> districts = [
    'Dhaka',
    'Chittagong',
    'Cumilla',
    'Feni',
    'Gazipur',
    'Narayanganj',
  ]; // Dummy data
  final List<String> upazilas = [
    'Savar',
    'Mirpur',
    'Hathazari',
    'Raozan',
  ]; // Dummy data
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
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
              _buildDropdown(
                'Division',
                divisions,
                selectedDivision,
                (val) => setState(() => selectedDivision = val),
              ),
              SizedBox(height: 16.h),
              _buildDropdown(
                'District',
                districts,
                selectedDistrict,
                (val) => setState(() => selectedDistrict = val),
              ),
              SizedBox(height: 16.h),
              _buildDropdown(
                'Upazila',
                upazilas,
                selectedUpazila,
                (val) => setState(() => selectedUpazila = val),
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
              _buildBloodGroupSelector(),

              SizedBox(height: 24.h),

              // Last Donate Date
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                style: TextStyle(fontSize: 14.sp),
                decoration: _inputDecoration(
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
                maxLines: 4,
                style: TextStyle(fontSize: 14.sp),
                decoration: _inputDecoration(
                  'Optional Details',
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

  Widget _buildBloodGroupSelector() {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: bloodGroups.map((bg) {
        final isSelected = selectedBloodGroup == bg;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedBloodGroup = bg;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0xFFF4F5F7),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              bg,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.primaryTextColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdown(
    String hint,
    List<String> items,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      elevation: 4,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.secondaryTextColor,
      ),
      decoration: _inputDecoration(hint),
    );
  }

  InputDecoration _inputDecoration(
    String label, {
    Widget? suffixIcon,
    bool alignLabelWithHint = false,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: AppColors.secondaryTextColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      suffixIcon: suffixIcon,
      alignLabelWithHint: alignLabelWithHint,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
    );
  }
}
