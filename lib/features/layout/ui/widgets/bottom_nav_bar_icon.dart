import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../logic/layout_cubit.dart';
import '../../logic/layout_state.dart';

class BottomNavIconWidget extends StatelessWidget {
  final String selectedIconPath;
  final String unSelectedIconPath;
  final int index;

  const BottomNavIconWidget({
    super.key,
    required this.selectedIconPath,
    required this.unSelectedIconPath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final LayoutCubit layoutCubit = context.read<LayoutCubit>();

    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (layoutCubit.currentPageIndex != index) {
              layoutCubit.changeLayoutState(index);
            }
          },
          icon: index < 4
              ? SvgPicture.asset(
                  layoutCubit.currentPageIndex == index
                      ? selectedIconPath
                      : unSelectedIconPath,
                  width: 26.w,
                  height: 26.h,
                )
              : profileIcon(layoutCubit),
        );
      },
    );
  }

  Container profileIcon(LayoutCubit layoutCubit) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: layoutCubit.currentPageIndex == index
            ? ColorsManager.mainBlue
            : Colors.transparent,
      ),
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: ColorsManager.white,
        child: const Icon(Icons.person),
      ),
    );
  }
}
