import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../data/models/doctor_model.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorWidget({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
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
          horizontalSpace(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyles.font14DarkBlueMedium,
              ),
              verticalSpace(4.h),
              Text(
                doctor.specialization.name,
                style: TextStyles.font12DarkBlueMedium,
              ),
              verticalSpace(4.h),
              Text(
                doctor.degree,
                style: TextStyles.font12DarkBlueMedium,
              ),
              verticalSpace(4.h),
              Text(
                "${doctor.price} EGP",
                style: TextStyles.font12DarkBlueMedium,
              ),
            ],
          ),
        ],
      ),
    ).setOnlyPadding(0, 16.h, 0, 0);
  }
}
