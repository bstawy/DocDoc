import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../data/models/appointment_model.dart';

class AppointmentWidget extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentWidget({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat("EEEE, MMMM d, yyyy h:mm a");
    DateTime parsedStartDate = format.parse(appointment.startTime);
    DateTime parsedEndDate = format.parse(appointment.endTime);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.all(8.h),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 30.r,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              color: ColorsManager.lighterGrey,
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: AssetImage("assets/images/home_find_nearby_doctor.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.doctor.name,
                style: TextStyles.font16DarkBlueMedium.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              Gap(4.h),
              Text(
                appointment.doctor.specialization.name,
                style: TextStyles.font12GreyRegular.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              Gap(4.h),
              Text(
                "${appointment.startTime.substring(0, appointment.startTime.lastIndexOf(","))}  |  ${parsedStartDate.hour}:${parsedStartDate.minute} }",
                style: TextStyles.font12DarkBlueMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
