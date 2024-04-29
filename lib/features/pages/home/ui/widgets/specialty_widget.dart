import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class SpecialistWidget extends StatelessWidget {
  final String title;
  final String? iconPath;

  SpecialistWidget({
    super.key,
    required this.title,
    this.iconPath,
  });

  final List<String> pngs = [
    "neurology",
    "pediatrics",
    "psychiatry",
    "urology",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: ColorsManager.lighterGrey,
          child: (pngs.contains(title.toLowerCase()))
              ? Image.asset(
                  "assets/icons/home_${title.toLowerCase()}_icon.png",
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                )
              : SvgPicture.asset(
                  iconPath ??
                      "assets/icons/home_${title.toLowerCase()}_icon.svg",
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
        ),
        verticalSpace(12.h),
        Text(
          title,
          style: TextStyles.font14DarkBlueMedium,
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
