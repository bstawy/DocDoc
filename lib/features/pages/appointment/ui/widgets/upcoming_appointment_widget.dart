import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../data/models/appointment_model.dart';

class UpcomingAppointmentWidget extends StatelessWidget {
  final AppointmentModel appointment;

  const UpcomingAppointmentWidget({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat("EEEE, MMMM d, yyyy h:mm a");
    DateTime parsedStartDate = format.parse(appointment.startTime);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 75.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: ColorsManager.lighterGrey,
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image:
                        AssetImage("assets/images/home_find_nearby_doctor.png"),
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
                    "${appointment.startTime.substring(0, appointment.startTime.lastIndexOf(","))}  |  ${parsedStartDate.hour}:${parsedStartDate.minute}",
                    style: TextStyles.font12GreyRegular.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(16.h),
          Divider(
            color: ColorsManager.lighterGrey,
            thickness: 2.h,
          ),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                child: CustomMaterialButton(
                  onClicked: () {},
                  title: "Cancel Appointment",
                  titleStyle: TextStyles.font12DarkBlueMedium.copyWith(
                    color: ColorsManager.mainBlue,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  backgroundColor: Colors.white,
                  borderColor: ColorsManager.mainBlue,
                  borderRadius: 50.r,
                  elevation: 0,
                  height: 40.h,
                ),
              ),
              Gap(16.w),
              Expanded(
                child: CustomMaterialButton(
                  onClicked: () {},
                  title: "Reschedule",
                  titleStyle: TextStyles.font12DarkBlueMedium.copyWith(
                    color: ColorsManager.white,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  borderRadius: 50.r,
                  elevation: 0,
                  height: 40.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
