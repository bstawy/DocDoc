import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'widgets/doctor_speciality_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/nearby_doctor_widget.dart';
import 'widgets/recommended_doctor_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const NearbyDoctor(),
              Gap(24.h),
              const DoctorSpeciality(),
              Gap(24.h),
              const RecommendedDoctor(),
            ],
          ),
        ),
      ],
    );
  }
}
