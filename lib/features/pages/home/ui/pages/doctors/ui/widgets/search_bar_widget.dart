import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/di/dependency_injection.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../data/models/doctor_model.dart';
import '../../logic/doctors_cubit.dart';
import 'sort_by_bottom_sheet_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final List<DoctorModel> doctors;

  const SearchBarWidget({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchBar(
            onQueryChanged: (value) {
              getIt<DoctorsCubit>().searchDoctor(value);
            },
            onEmptyQuery: () {
              getIt<DoctorsCubit>().getAllDoctors();
            },
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
          child: SortByBottomSheetWidget(doctors: doctors),
        );
      },
    );
  }
}
