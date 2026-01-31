import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/auth/details_info/view/detail_info_widgets.dart';
import 'package:rokto/features/profile/controller/profile_controller.dart';
import 'package:rokto/features/profile/view/widgets/setting_title.dart';

class LastDonateWidget extends ConsumerWidget {
  const LastDonateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return buildSettingsTile(
      onTap: () async {
        showCustomDatePicker(
          context: context,
          onDateSelected: (date) {
            ref
                .read(profileControllerProvider.notifier)
                .updateLastDonationDate(date);
            ref.watch(profileControllerProvider);
          },
        );
      },
      image: SvgPicture.asset(
        ImageRes.calendar, // Reusing calendar icon
        width: 24.w,
        height: 24.h,
      ),
      title: "Update Last Donation Date",
      isLast: false,
    );
  }
}
