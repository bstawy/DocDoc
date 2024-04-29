import 'package:docdoc/features/pages/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../data/models/home_response_model.dart';
import '../../logic/home_state.dart';
import 'specialist_widget.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeData> specialities = [];
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
          bloc: context.read<HomeCubit>(),
          builder: (context, state) {
            return state.whenOrNull(
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  success: (data) {
                    specialities = data;
                    debugPrint("Data length = ${specialities.length}");
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
                  },
                ) ??
                const SizedBox(); // Add null check and return a default widget if state is null
          },
        ),
      ],
    );
  }
}
