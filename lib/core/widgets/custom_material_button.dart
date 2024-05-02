import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/texts/text_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  final String? title;
  final double? height, width, elevation, borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final Widget? child;
  final bool enabled;
  final VoidCallback onClicked;

  const CustomMaterialButton({
    super.key,
    required this.onClicked,
    this.title,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.elevation,
    this.titleStyle,
    this.child,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        if (enabled) {
          onClicked();
        }
      },
      height: height ?? 56.h,
      minWidth: width ?? double.maxFinite,
      elevation: elevation,
      padding: padding,
      color: backgroundColor ?? theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
      ),
      child: child ??
          Text(
            title ?? "Continue",
            style: titleStyle ?? TextStyles.font16WhiteSemiBold,
          ),
    );
  }
}
