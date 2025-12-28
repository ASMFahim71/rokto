import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/core/common/widgets/app_popup.dart';
import 'package:rokto/features/home/widgets/home_grid_button.dart';
import 'package:rokto/core/routes/app_routes_names.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        crossAxisCount: 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.8,
        children: [
          HomeGridButton(
            icon: ImageRes.findDoner,
            label: 'Find Donors',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesNames.findDonors);
            },
          ),
          HomeGridButton(
            icon: ImageRes.donate,
            label: 'Donate',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesNames.donationRequest);
            },
          ),
          HomeGridButton(
            icon: ImageRes.orderBlood,
            label: 'Order Blood',
            onTap: () {},
          ),
          HomeGridButton(
            icon: ImageRes.myRequests,
            label: 'My Requests',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesNames.myRequests);
            },
          ),
          HomeGridButton(
            icon: ImageRes.report,
            label: 'Report',
            onTap: () {
              Navigator.pushNamed(context, AppRoutesNames.report);
            },
          ),
          HomeGridButton(
            icon: ImageRes.campaign,
            label: 'Campaign',
            onTap: () {
              toastInfo("Not implemented yet");
            },
          ),
        ],
      ),
    );
  }
}
