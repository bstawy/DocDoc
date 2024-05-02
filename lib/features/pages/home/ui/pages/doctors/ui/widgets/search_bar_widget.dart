import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/doctors_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _searchController = TextEditingController();
  Timer? _debounceTimer;
  String lastQuery = "";

  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (query != lastQuery) {
        lastQuery = query;
        context.read<DoctorsCubit>().searchDoctor(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: _searchController,
            onChanged: (value) => _onSearchQueryChanged(value ?? ""),
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
            // focusedBorderColor: ColorsManager.grey,
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

  @override
  dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
