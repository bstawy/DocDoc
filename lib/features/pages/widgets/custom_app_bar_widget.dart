import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/texts/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../layout/logic/layout_cubit.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leadingIcon;
  final Widget? actionIcon;
  final Function()? onLeadingTap;
  final Function()? onActionTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.actionIcon,
    this.onLeadingTap,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onLeadingTap ??
              () {
                context.read<LayoutCubit>().changePage(0);
              },
          icon: leadingIcon ?? const Icon(Icons.arrow_back_ios),
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyles.font18DarkBlueBold,
        ),
        const Spacer(),
        IconButton(
          onPressed: onActionTap ?? () {},
          icon: actionIcon ?? SizedBox(width: 24.w),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
