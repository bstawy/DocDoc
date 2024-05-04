import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/shimmer_loading_effect/circular_shimmer_effect.dart';
import '../../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../data/models/doctor_speciality_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_states.dart';
import 'section_header_widget.dart';
import 'specialty_widget.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Doctor Specialities",
          actionText: "See all",
          onActionTap: () {
            context.pushNamed(Routes.specialitiesScreen);
          },
        ),
        Gap(8.h),
        BlocBuilder<HomeCubit, HomeStates>(
          bloc: context.read<HomeCubit>()..getDoctorSpecialityData(),
          buildWhen: (previous, current) {
            if (current is DoctorSpecialityLoading ||
                current is DoctorSpecialitySuccess) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return state.whenOrNull(
                  doctorSpecialityLoading: () => buildLoadingWidget(),
                  doctorSpecialitySuccess: (data) => buildSuccessWidget(data),
                ) ??
                const SizedBox(); // Add null check and return a default widget if state is null
          },
        ),
      ],
    ).setHorizontalPadding(16.w);
  }

  Widget buildLoadingWidget() {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 112.w,
            child: Column(
              children: [
                const CircularShimmerEffect(),
                Gap(12.h),
                const RectShimmerEffect(width: 30, height: 10),
              ],
            ).setHorizontalPadding(8.w),
          );
        },
      ),
    );
  }

  Widget buildSuccessWidget(List<DoctorSpecialityModel> specialities) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return SpecialistWidget(
            title: specialities[index].name,
          );
        },
      ),
    );
  }
}
