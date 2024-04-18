import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/colors/light_color_scheme.dart';
import 'bottom_nav_bar_icon.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: ColorsManager.white,
      shadowColor: Colors.black.withOpacity(0.03),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          const Expanded(
            child: BottomNavIconWidget(
              selectedIconPath: 'assets/icons/nav_bar_home_icon.svg',
              unSelectedIconPath:
                  'assets/icons/nav_bar_home_unselected_icon.svg',
              index: 0,
            ),
          ),
          const Expanded(
            child: BottomNavIconWidget(
              selectedIconPath: 'assets/icons/nav_bar_message_icon.svg',
              unSelectedIconPath:
                  'assets/icons/nav_bar_message_unselected_icon.svg',
              index: 1,
            ),
          ),
          SizedBox(width: 65.w),
          const Expanded(
            child: BottomNavIconWidget(
              selectedIconPath: 'assets/icons/nav_bar_calender_icon.svg',
              unSelectedIconPath:
                  'assets/icons/nav_bar_calender_unselected_icon.svg',
              index: 3,
            ),
          ),
          const Expanded(
            child: BottomNavIconWidget(
              selectedIconPath: '',
              unSelectedIconPath: '',
              index: 4,
            ),
          ),
        ],
      ),
    );
  }
}
