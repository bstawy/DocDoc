import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/config/Constants/app_constants.dart';
import '../../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../../core/widgets/custom_material_button.dart';
import '../../../../../data/models/doctor_model.dart';
import '../../logic/doctors_cubit.dart';
import 'sort_by_item_widget.dart';

class SortByBottomSheetWidget extends StatefulWidget {
  final List<DoctorModel> doctors;

  const SortByBottomSheetWidget({
    super.key,
    required this.doctors,
  });

  @override
  State<SortByBottomSheetWidget> createState() =>
      _SortByBottomSheetWidgetState();
}

class _SortByBottomSheetWidgetState extends State<SortByBottomSheetWidget> {
  final List<(String, SortBySpecialization)> specialities = [
    ('All', SortBySpecialization.all),
    ('Cardiology', SortBySpecialization.cardiology),
    ('Dermatology', SortBySpecialization.dermatology),
    ('Neurology', SortBySpecialization.neurology),
    ('Orthopedics', SortBySpecialization.orthopedics),
    ('Pediatrics', SortBySpecialization.pediatrics),
    ('Gynecology', SortBySpecialization.gynecology),
    ('Ophthalmology', SortBySpecialization.ophthalmology),
    ('Urology', SortBySpecialization.urology),
    ('Gastroenterology', SortBySpecialization.gastroenterology),
    ('Psychiatry', SortBySpecialization.psychiatry),
  ];

  final List<(String, SortByDegree)> degrees = [
    ('All', SortByDegree.all),
    ("Consultant", SortByDegree.consultant),
    ("Specialist", SortByDegree.specialist),
    ("Professor", SortByDegree.professor),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            blurRadius: 20.r,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          verticalSpace(16.h),
          Container(
            width: 0.2.sw,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(24.h),
          Text(
            'Sort By',
            style: TextStyles.font18DarkBlueBold,
          ),
          verticalSpace(24.h),
          Container(
            width: 0.7.sw,
            height: 2.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(32.h),
          SortByItemWidget(title: 'Speciality', items: specialities),
          verticalSpace(32.h),
          SortByItemWidget(title: 'Degree', items: degrees),
          verticalSpace(40.h),
          CustomMaterialButton(
            onClicked: () {
              context.read<DoctorsCubit>().sortDoctors(widget.doctors);
              context.pop();
            },
            title: "Done",
          ).setHorizontalPadding(24.w),
        ],
      ),
    );
  }
}
