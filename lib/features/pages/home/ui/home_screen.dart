import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import 'widgets/doctor_speciality_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/nearby_doctor_widget.dart';
import 'widgets/recommended_doctor_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();

    return BlocListener<HomeCubit, HomeState>(
      bloc: homeCubit..getHomeData(),
      listener: (context, state) {},
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Header(),
                const NearbyDoctor(),
                verticalSpace(24.h),
                BlocProvider.value(
                  value: homeCubit,
                  child: const DoctorSpeciality(),
                ),
                verticalSpace(24.h),
                const RecommendedDoctor(),
              ],
            ),
          ),
        ],
      ).setHorizontalPadding(16.w),
    );
  }
}
