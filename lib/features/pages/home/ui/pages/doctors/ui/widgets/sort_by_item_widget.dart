import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/Constants/app_constants.dart';
import '../../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../logic/doctors_cubit.dart';

class SortByItemWidget extends StatefulWidget {
  final String title;
  final List<(String, dynamic)> items;

  const SortByItemWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  State<SortByItemWidget> createState() => _SortByItemWidgetState();
}

class _SortByItemWidgetState extends State<SortByItemWidget> {
  late Set<dynamic> _selectedSegment;

  @override
  void initState() {
    super.initState();
    _selectedSegment = {widget.items[0].$2};
    if (widget.title == "Speciality") {
      context.read<DoctorsCubit>().sortBySpecialization = widget.items[0].$2;
    } else {
      context.read<DoctorsCubit>().sortByDegree = widget.items[0].$2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyles.font16DarkBlueMedium,
        ).setHorizontalPadding(24.w),
        verticalSpace(16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              horizontalSpace(24.w),
              SegmentedButton<dynamic>(
                segments: List.generate(
                  widget.items.length,
                  (index) => ButtonSegment<dynamic>(
                    label: Text(widget.items[index].$1),
                    value: widget.items[index].$2,
                  ),
                ),
                selected: _selectedSegment,
                onSelectionChanged: updateSelectedSegments,
                showSelectedIcon: false,
                emptySelectionAllowed: false,
                style: SegmentedButton.styleFrom(
                  selectedBackgroundColor:
                      ColorsManager.mainBlue.withOpacity(0.25),
                  textStyle: TextStyles.font14DarkBlueMedium,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),
              horizontalSpace(24.w),
            ],
          ),
        ),
      ],
    );
  }

  updateSelectedSegments(Set<dynamic> newSelection) {
    _selectedSegment = newSelection;

    if (widget.title == "Speciality") {
      context.read<DoctorsCubit>().sortBySpecialization =
          _selectedSegment.first as SortBySpecialization?;
    } else {
      context.read<DoctorsCubit>().sortByDegree =
          _selectedSegment.first as SortByDegree?;
    }

    setState(() {});
  }
}
