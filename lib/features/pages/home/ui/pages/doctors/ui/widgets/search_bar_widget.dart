import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hint: "Search",
            prefixIcon: Icon(
              Icons.search,
              size: 24.r,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
              vertical: 10.0.h,
            ),
            backgroundColor: ColorsManager.lighterGrey,
            focusedBorderColor: ColorsManager.grey,
          ),
        ),
        horizontalSpace(8.w),
        IconButton(
          onPressed: () {
            // TODO: open sort by bottom sheet
          },
          iconSize: 24.r,
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.filter_list_outlined,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}
