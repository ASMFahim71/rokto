import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/features/home/widgets/home_grid_button.dart';

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
        childAspectRatio: 0.9, 
        children: [
          HomeGridButton(
            icon: FeatherIcons.search,
            label: 'Find Donors',
            onTap: () {},
          ),
          HomeGridButton(
            icon: FeatherIcons.droplet,
            label: 'Donate',
            onTap: () {},
          ),
          HomeGridButton(
            icon: Icons.bloodtype_outlined,
            label: 'Order Blood',
            onTap: () {},
          ),
          HomeGridButton(
            icon: Icons.medical_services_outlined,
            label: 'Assistant',
            onTap: () {},
          ),
          HomeGridButton(
            icon: FeatherIcons.fileText,
            label: 'Report',
            onTap: () {},
          ),
          HomeGridButton(
            icon: FeatherIcons.mic,
            label: 'Campaign',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
