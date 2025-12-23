import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/features/create_request/controller/location_controller.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/core/common/widgets/elevated_button.dart';
import 'package:rokto/features/create_request/controller/create_request_controller.dart';
import 'package:rokto/features/create_request/view/widgets/request_dropdown.dart';
import 'package:rokto/features/create_request/view/widgets/request_text_field.dart';
import 'package:rokto/features/create_request/view/widgets/request_autocomplete.dart';
import 'package:intl/intl.dart';

class CreateRequestScreen extends ConsumerStatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  ConsumerState<CreateRequestScreen> createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState extends ConsumerState<CreateRequestScreen> {
  String? _selectedBloodGroup;
  String? _selectedGender;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _causeController = TextEditingController();
  // Location Controllers
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _thanaController = TextEditingController();
  final TextEditingController _upazilaController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

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

  // State for filtering
  List<String> _availableThanas = [];
  List<String> _availableUpazilas = [];

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _causeController.dispose();
    _districtController.dispose();
    _thanaController.dispose();
    _upazilaController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
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
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
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

  void _onDistrictSelected(String selection) {
    setState(() {
      _districtController.text = selection;
      _availableThanas = [];
      _availableUpazilas = [];
      _thanaController.clear();
      _upazilaController.clear();
    });
  }

  void _onThanaSelected(String selection) {
    setState(() {
      _thanaController.text = selection;
      _availableUpazilas = [];
      _upazilaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildGlobalAppBar(title: "Create A Request"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            RequestDropdown(
              hintText: "Blood Group",
              icon: Icons.bloodtype_outlined,
              items: _bloodGroups,
              value: _selectedBloodGroup,
              onChanged: (val) {
                setState(() {
                  _selectedBloodGroup = val;
                });
              },
            ),
            SizedBox(height: 15.h),

            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: RequestTextField(
                  controller: _dateController,
                  hintText: "Date",
                  icon: Icons.calendar_today_outlined,
                ),
              ),
            ),
            SizedBox(height: 15.h),

            GestureDetector(
              onTap: () => _selectTime(context),
              child: AbsorbPointer(
                child: RequestTextField(
                  controller: _timeController,
                  hintText: "Time",
                  icon: Icons.access_time_outlined,
                ),
              ),
            ),
            SizedBox(height: 15.h),

            RequestTextField(
              controller: _causeController,
              hintText: "Cause",
              icon: Icons.sick_outlined,
            ),
            SizedBox(height: 15.h),

            // District Autocomplete
            Consumer(
              builder: (context, ref, child) {

                return RequestAutocomplete(
                  controller: _districtController,
                  hintText: "District",
                  icon: Icons.location_on_outlined,
                  options: const [],
                  onSelected: (val) async {
                    _onDistrictSelected(val);
                    // Fetch options
                    final thanas = await ref
                        .read(locationControllerProvider.notifier)
                        .getThanas(val);
                    setState(() {
                      _availableThanas = thanas;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 15.h),

            // Thana Autocomplete (Filtered by District)
            RequestAutocomplete(
              controller: _thanaController,
              hintText: "Thana",
              icon: Icons.map_outlined,
              options: _availableThanas,
              onSelected: (val) async {
                _onThanaSelected(val);
                final upazilas = await ref
                    .read(locationControllerProvider.notifier)
                    .getUpazilas(val);
                setState(() {
                  _availableUpazilas = upazilas;
                });
              },
            ),
            SizedBox(height: 15.h),

            // Upazila Autocomplete (Filtered by Thana)
            RequestAutocomplete(
              controller: _upazilaController,
              hintText: "Upazila",
              icon: Icons.holiday_village_outlined,
              options: _availableUpazilas,
              onSelected: (selection) {
                _upazilaController.text = selection;
              },
            ),
            SizedBox(height: 15.h),

            RequestDropdown(
              hintText: "Gender",
              icon: Icons.person_outline,
              items: _genders,
              value: _selectedGender,
              onChanged: (val) {
                setState(() {
                  _selectedGender = val;
                });
              },
            ),
            SizedBox(height: 15.h),

            RequestTextField(
              controller: _mobileController,
              hintText: "Mobile",
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 50.h),
            CustomElevatedButton(
              text: "Request",
              onPressed: () {
                if (_selectedBloodGroup == null || _selectedGender == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select Blood Group and Gender"),
                    ),
                  );
                  return;
                }

                ref
                    .read(createRequestControllerProvider.notifier)
                    .submitRequest(
                      bloodGroup: _selectedBloodGroup!,
                      date: _dateController.text,
                      time: _timeController.text,
                      cause: _causeController.text,
                      district: _districtController.text,
                      thana: _thanaController.text,
                      upazila: _upazilaController.text,
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
