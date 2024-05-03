import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../../../data/models/doctor_model.dart';
import '../../../widgets/doctor_widget.dart';
import '../logic/doctors_cubit.dart';
import '../logic/doctors_state.dart';
import 'widgets/search_bar_widget.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'All Doctors',
        ),
      ),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        bloc: context.read<DoctorsCubit>()..getAllDoctors(),
        builder: (context, state) {
          return RefreshIndicator(
            color: ColorsManager.mainBlue,
            onRefresh: () async {
              context.read<DoctorsCubit>().getAllDoctors();
            },
            child: state.whenOrNull(
                  doctorsListLoading: () => _buildLoadingWidget(),
                  doctorsListSuccess: (data) => _buildSuccessWidget(data),
                ) ??
                const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          verticalSpace(16.h),
          const SearchBarWidget(
            doctors: [],
          ).setHorizontalPadding(16.h),
          verticalSpace(24.h),
          Column(
            children: List.generate(
              3,
              (index) => Row(
                children: [
                  const RectShimmerEffect(
                    width: 110,
                    height: 110,
                  ),
                  horizontalSpace(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RectShimmerEffect(width: 90, height: 10),
                      verticalSpace(16.h),
                      const RectShimmerEffect(width: 90, height: 10),
                      verticalSpace(16.h),
                      const RectShimmerEffect(width: 90, height: 10),
                    ],
                  ),
                ],
              ).setOnlyPadding(0, 16.h, 0, 0),
            ),
          ).setHorizontalPadding(16.h),
        ],
      ),
    );
  }

  Widget _buildSuccessWidget(List<DoctorModel> doctors) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          verticalSpace(16.h),
          SearchBarWidget(doctors: doctors).setHorizontalPadding(16.h),
          verticalSpace(24.h),
          doctors.isNotEmpty
              ? Column(
                  children: List.generate(
                    doctors.length,
                    (index) => DoctorWidget(
                      doctor: doctors[index],
                    ),
                  ),
                )
              : _buildEmptyWidget(),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Column(
      children: [
        verticalSpace(75.h),
        SvgPicture.asset(
          "assets/images/doctors_illustration.svg",
          width: 150.w,
          height: 150.h,
        ),
        verticalSpace(40.h),
        Text(
          'No Doctors Found',
          style: TextStyles.font18DarkBlueBold.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    ).setHorizontalPadding(32.w);
  }
}
