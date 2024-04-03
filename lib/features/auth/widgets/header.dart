import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/texts/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';

class WelcomeHeader extends StatelessWidget {
  final String title;
  final String description;

  const WelcomeHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(8.h),
        Text(
          description,
          style: TextStyles.font14GreyRegular,
        ),
      ],
    ).setHorizontalPadding(32.w);
  }
}
