import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../data/models/doctor_speciality_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'specialty_widget.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Doctor Speciality",
              style: TextStyles.font18DarkBlueBold,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // TODO: see all doctor speciality
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
                  doctorSpecialityLoading: () =>
                      const CircularProgressIndicator(),
                  doctorSpecialitySuccess: (data) {
                    return buildDoctorSpecialitySuccessWidget(data);
                  },
                ) ??
                const SizedBox(); // Add null check and return a default widget if state is null
          },
        ),
      ],
    );
  }

  SizedBox buildDoctorSpecialitySuccessWidget(
      List<DoctorSpecialityModel> specialities) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
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
