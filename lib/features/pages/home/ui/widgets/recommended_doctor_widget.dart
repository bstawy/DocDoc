import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
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
                  doctorListLoading: () => const CircularProgressIndicator(),
                  doctorListSuccess: (data) {
                    final List<DoctorModel> doctors = data;

                    return buildRecommendedDoctorSuccessWidget(doctors);
                  },
                ) ??
                const SizedBox();
          },
        ).setHorizontalPadding(8.w),
        verticalSpace(16.h),
      ],
    );
  }

  Widget buildRecommendedDoctorSuccessWidget(List<DoctorModel> doctors) {
    return Column(
      children: List.generate(
        3,
        (index) => DoctorWidget(doctor: doctors[index]),
      ),
    );
  }
}
