import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage:
                  const AssetImage("assets/images/home_find_nearby_doctor.png"),
            ).setHorizontalPadding(8.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr.Randy Wigham",
                    style: TextStyles.font14DarkBlueMedium,
                  ),
                  Text(
                    "General Doctor",
                    style: TextStyles.font12GreyRegular,
                  ),
                  Gap(8.h),
                  Text(
                    "Fine, I'll do a check. Does the patient have a history of certain diseases?",
                    style: TextStyles.font12GreyRegular,
                  ),
                ],
              ),
            ),
            Gap(16.w),
            Column(
              children: [
                Text(
                  "7:15 AM",
                  style: TextStyles.font12GreyRegular,
                ),
                Gap(32.h),
                Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlue,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: TextStyles.font12BlueRegular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).setHorizontalPadding(16.w),
        Gap(16.h),
        const Divider(
          color: ColorsManager.lightGrey,
          thickness: 0.5,
        ).setHorizontalPadding(16.w),
        Gap(16.h),
      ],
    );
  }
}
