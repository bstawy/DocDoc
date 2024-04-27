import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../logic/cubit/home_cubit.dart';
import '../logic/cubit/home_state.dart';
import 'widgets/doctor_speciality_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/nearby_doctor_widget.dart';
import 'widgets/recommended_doctor_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getHomeData(),
      builder: (context, state) {
        return CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Header(),
                  const NearbyDoctor(),
                  verticalSpace(24.h),
                  const DoctorSpeciality(),
                  verticalSpace(24.h),
                  const RecommendedDoctor(),
                ],
              ),
            ),
          ],
        );
      },
    ).setHorizontalPadding(16.w);
  }
}
