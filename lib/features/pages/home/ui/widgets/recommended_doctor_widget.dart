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
          builder: (context, state) {
            return state.whenOrNull(
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  success: (data) {
                    final List<DoctorModel> doctors = data;

                    return SizedBox(
                      height: 130.h,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return DoctorWidget(doctor: doctors[index]);
                        },
                      ),
                    );
                  },
                ) ??
                const SizedBox(); // Add null check and return a default widget if state is null
          },
        ).setHorizontalPadding(8.w),
        verticalSpace(16.h),
      ],
    );
  }
}
