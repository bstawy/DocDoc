import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/shimmer_loading_effect/circular_shimmer_effect.dart';
import '../../../../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../../../data/models/doctor_speciality_model.dart';
import '../../../widgets/specialty_widget.dart';
import '../logic/specialities_cubit.dart';
import '../logic/specialities_state.dart';

class SpecialitiesScreen extends StatelessWidget {
  const SpecialitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Doctor Specialities',
          style: TextStyles.font18DarkBlueBold,
        ),
      ),
      body: BlocBuilder<SpecialitiesCubit, SpecialitiesState>(
        bloc: context.read<SpecialitiesCubit>()..getSpecialities(),
        builder: (context, state) {
          return state.whenOrNull(
                loading: () => _buildLoadingWidget(),
                success: (data) => _buildSuccessWidget(data),
                failure: (error) => Center(child: Text(error)),
              ) ??
              const SizedBox();
        },
      ).setOnlyPadding(32.h, 0, 32.w, 32.w),
    );
  }

  Widget _buildLoadingWidget() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 120.h,
      ),
      itemCount: 6,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 112.w,
          child: Column(
            children: [
              const CircularShimmerEffect(),
              verticalSpace(12.h),
              const RectShimmerEffect(width: 30, height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSuccessWidget(List<DoctorSpecialityModel> data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 120.h,
      ),
      itemCount: data.length,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SpecialistWidget(title: data[index].name);
      },
    );
  }
}
