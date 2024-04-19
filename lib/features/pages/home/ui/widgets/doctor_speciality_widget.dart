import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Doctor Speciality",
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
          width: double.maxFinite,
          height: 130.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 16.h),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
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
            },
          ),
        ),
      ],
    );
  }
}
