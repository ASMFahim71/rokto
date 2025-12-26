import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/features/donation_request/controller/donation_request_controller.dart';
import 'package:rokto/features/home/widgets/donation_request_card.dart';

class DonationRequestScreen extends ConsumerWidget {
  const DonationRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(donationRequestControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildGlobalAppBar(title: "Donation Request", context: context),
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: 100.h,
        ),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return DonationRequestCard(
            request: request,
            onDonate: () {
              // TODO: Implement donation logic
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
      ),
    );
  }
}
