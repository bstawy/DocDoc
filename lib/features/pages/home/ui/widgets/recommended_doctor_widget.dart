import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class RecommendedDoctor extends StatelessWidget {
  const RecommendedDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Recommended Doctor",
              style: TextStyles.font18DarkBlueBold,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // TODO: see all doctor speciality
              },
              child: Text(
                "See all",
                style: TextStyles.font12BlueRegular,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.7.sh,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 16.h, left: 8.w),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterGrey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  horizontalSpace(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. x",
                        style: TextStyles.font14DarkBlueMedium,
                      ),
                      verticalSpace(4.h),
                      Text(
                        "Speciality",
                        style: TextStyles.font12DarkBlueMedium,
                      ),
                      verticalSpace(4.h),
                      Text(
                        "Hospital",
                        style: TextStyles.font12DarkBlueMedium,
                      ),
                      verticalSpace(4.h),
                      Text(
                        "Rating",
                        style: TextStyles.font12DarkBlueMedium,
                      ),
                    ],
                  ),
                ],
              ).setOnlyPadding(0, 32.h, 0, 0);
            },
          ),
        ),
      ],
    );
  }
}

/*
Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: ColorsManager.lighterGrey,
                    child: const Icon(
                      Icons.medical_services,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  verticalSpace(12.h),
                  Text(
                    "x",
                    style: TextStyles.font14DarkBlueMedium,
                  ),
                ],
              ).setHorizontalPadding(16.w);
*/