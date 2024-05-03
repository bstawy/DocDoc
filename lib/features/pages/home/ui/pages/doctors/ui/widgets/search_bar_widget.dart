import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../data/models/doctor_model.dart';
import '../../logic/doctors_cubit.dart';
import 'sort_by_bottom_sheet_widget.dart';

class SearchBarWidget extends StatefulWidget {
  final List<DoctorModel> doctors;
  const SearchBarWidget({super.key, required this.doctors});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  // TODO: separate search bar from filter icon
  final _searchController = TextEditingController();
  Timer? _debounceTimer;
  String lastQuery = "";

  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty && query != lastQuery) {
        lastQuery = query;
        context.read<DoctorsCubit>().searchDoctor(query);
      }
      if (_searchController.text.isEmpty) {
        context.read<DoctorsCubit>().getAllDoctors();
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
            _openModalBottomSheet(context, context.read<DoctorsCubit>());
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

  void _openModalBottomSheet(BuildContext context, DoctorsCubit doctorsCubit) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: doctorsCubit,
          child: SortByBottomSheetWidget(doctors: widget.doctors),
        );
      },
    );
  }

  @override
  dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
