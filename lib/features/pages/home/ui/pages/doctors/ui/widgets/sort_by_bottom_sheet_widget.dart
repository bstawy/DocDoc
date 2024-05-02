import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_material_button.dart';

class SortByBottomSheetWidget extends StatelessWidget {
  const SortByBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            blurRadius: 20.r,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          verticalSpace(16.h),
          Container(
            width: 0.2.sw,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(24.h),
          Text(
            'Sort By',
            style: TextStyles.font18DarkBlueBold,
          ),
          verticalSpace(24.h),
          Container(
            width: 0.7.sw,
            height: 2.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(32.h),
          _buildSortByItem('Name'),
          verticalSpace(32.h),
          _buildSortByItem('Specialization'),
          verticalSpace(40.h),
          CustomMaterialButton(
            onClicked: () {
              // TODO: Implement sort by
              context.pop();
            },
            title: "Done",
          ).setHorizontalAndVerticalPadding(24.w, 16.h),
        ],
      ),
    );
  }

  Widget _buildSortByItem(String title) {
    // TODO: Implement sort by item UI
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font16DarkBlueMedium),
        verticalSpace(24.h),
        Row(
          children: [
            Text(
              title,
              style: TextStyles.font14DarkBlueMedium,
            ),
            Icon(
              Icons.check_circle,
              color: Colors.blue,
              size: 24.r,
            ),
          ],
        ),
      ],
    ).setOnlyPadding(0, 0, 0, 24.w);
  }
}
