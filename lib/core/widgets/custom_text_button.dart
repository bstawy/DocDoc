import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/texts/font_weight_helper.dart';
import '../config/theme/texts/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? horizontalPadding, verticalPadding;
  final VoidCallback onPressed;

  final double? borderRadius;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0,
          vertical: verticalPadding ?? 0,
        )),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
        ),
      ),
      child: Text(
        text,
        style: style ??
            TextStyles.font12BlueRegular
                .copyWith(fontWeight: FontWeightHelper.semiBold),
      ),
    );
  }
}
