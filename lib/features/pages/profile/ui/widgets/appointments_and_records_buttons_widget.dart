import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class AppointmentsAndRecordsButtons extends StatelessWidget {
  const AppointmentsAndRecordsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextButton(
              onPressed: () {},
              text: "My Appointments",
              style: TextStyles.font12DarkBlueMedium.copyWith(
                fontWeight: FontWeight.w400,
              ),
              minimumSize: Size(0, 60.h),
            ),
          ),
          const VerticalDivider(
            color: ColorsManager.lighterGrey,
            thickness: 1,
          ).setVerticalPadding(8.h),
          Expanded(
            child: CustomTextButton(
              onPressed: () {},
              text: "Medical records",
              style: TextStyles.font12DarkBlueMedium.copyWith(
                fontWeight: FontWeight.w400,
              ),
              minimumSize: Size(0, 60.h),
            ),
          ),
        ],
      ),
    );
  }
}
