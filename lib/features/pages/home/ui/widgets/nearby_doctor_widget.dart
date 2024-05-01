import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class NearbyDoctor extends StatelessWidget {
  const NearbyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 30.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/home_find_nearby_background_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 145.w,
                  child: Text(
                    'Book and schedule with nearest doctor',
                    style: TextStyles.font18WhiteMedium,
                  ),
                ),
                const Spacer(),
                CustomMaterialButton(
                  onClicked: () {
                    //TODO: open nearby doctor
                  },
                  backgroundColor: ColorsManager.white,
                  borderRadius: 50.r,
                  height: 40.h,
                  width: 110.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  titleStyle: TextStyles.font12BlueRegular,
                  title: "Find Nearby",
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 200.h,
              width: 135.w,
              child: Image.asset(
                'assets/images/home_find_nearby_doctor.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
