import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/custom_search_bar.dart';
import '../home/data/models/doctor_model.dart';

class SearchBarWidget extends StatelessWidget {
  final List<DoctorModel> doctors;
  final Function(String)? onQueryChanged;
  final Function()? onEmptyQuery;
  final Function()? onFilterTap;

  const SearchBarWidget({
    super.key,
    required this.doctors,
    this.onQueryChanged,
    this.onEmptyQuery,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchBar(
            onQueryChanged: onQueryChanged ?? (query) {},
            onEmptyQuery: onEmptyQuery ?? () {},
          ),
        ),
        Gap(8.w),
        IconButton(
          onPressed: onFilterTap,
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
