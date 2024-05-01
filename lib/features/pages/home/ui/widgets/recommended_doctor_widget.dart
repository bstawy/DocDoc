import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../data/models/doctor_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_widget.dart';

class RecommendedDoctor extends StatelessWidget {
  const RecommendedDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Recommended Doctor",
              style: TextStyles.font18DarkBlueBold,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // TODO: see all doctors
              },
              child: Text(
                "See all",
                style: TextStyles.font12BlueRegular,
              ),
            ),
          ],
        ),
        verticalSpace(8.h),
        BlocBuilder<HomeCubit, HomeState>(
          bloc: context.read<HomeCubit>()..getAllDoctorsData(),
          buildWhen: (previous, current) {
            if (current is DoctorListLoading || current is DoctorListSuccess) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return state.whenOrNull(
                  doctorListLoading: () => buildLoadingWidget(),
                  doctorListSuccess: (data) {
                    final List<DoctorModel> doctors = data;

                    return buildSuccessWidget(doctors);
                  },
                ) ??
                const SizedBox();
          },
        ).setHorizontalPadding(8.w),
        verticalSpace(16.h),
      ],
    );
  }

  Widget buildLoadingWidget() {
    return Column(
      children: List.generate(
        3,
        (index) => Row(
          children: [
            const RectShimmerEffect(
              width: 110,
              height: 110,
            ),
            horizontalSpace(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RectShimmerEffect(width: 90, height: 10),
                verticalSpace(16.h),
                const RectShimmerEffect(width: 90, height: 10),
                verticalSpace(16.h),
                const RectShimmerEffect(width: 90, height: 10),
              ],
            ),
          ],
        ).setOnlyPadding(0, 16.h, 0, 0),
      ),
    );
  }

  Widget buildSuccessWidget(List<DoctorModel> doctors) {
    return Column(
      children: List.generate(
        3,
        (index) => DoctorWidget(doctor: doctors[index]),
      ),
    );
  }
}
