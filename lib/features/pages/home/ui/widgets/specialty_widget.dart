import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:marquee/marquee.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
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
    return SizedBox(
      width: 112.w,
      child: Column(
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
          Gap(12.h),
          SizedBox(
            height: 25.h,
            child: AutoSizeText(
              title,
              style: TextStyles.font14DarkBlueMedium,
              minFontSize: 14.sp,
              stepGranularity: 0.1.sp,
              maxLines: 1,
              overflowReplacement: Marquee(
                text: title,
                style: TextStyles.font14DarkBlueMedium,
                scrollAxis: Axis.horizontal,
                velocity: 30,
                startAfter: const Duration(seconds: 1),
                blankSpace: 20,
              ),
            ),
          ),
        ],
      ).setHorizontalPadding(8.w),
    );
  }
}
