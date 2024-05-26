import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 40.r,
              height: 40.r,
            ),
            Gap(16.w),
            Text(
              title,
              style: TextStyles.font14DarkBlueMedium.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
        Gap(16.h),
        const Divider(
          color: ColorsManager.lightGrey,
        ),
        Gap(16.h),
      ],
    );
  }
}
