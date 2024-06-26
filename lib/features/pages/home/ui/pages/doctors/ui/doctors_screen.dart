import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../../../../search/logic/search_cubit.dart';
import '../../../../../search/logic/search_states.dart';
import '../../../../../widgets/search_bar_widget.dart';
import '../../../../data/models/doctor_model.dart';
import '../../../widgets/doctor_widget.dart';
import '../logic/doctors_cubit.dart';
import '../logic/doctors_states.dart';
import 'widgets/sort_by_bottom_sheet_widget.dart';

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
        title: const Text('All Doctors'),
      ),
      body: BlocBuilder<DoctorsCubit, DoctorsStates>(
        bloc: context.read<DoctorsCubit>()..getAllDoctors(),
        builder: (context, state) {
          return RefreshIndicator(
            color: ColorsManager.mainBlue,
            onRefresh: () async {
              context.read<DoctorsCubit>().getAllDoctors();
            },
            child: state.whenOrNull(
                  doctorsListLoading: () => _buildLoadingWidget(),
                  doctorsListSuccess: (doctorsData) {
                    return BlocBuilder<SearchCubit, SearchStates>(
                      bloc: context.read<SearchCubit>()..getInitialState(),
                      builder: (context, state) {
                        debugPrint('SearchCubit state: ${state.toString()}');

                        return state.maybeWhen(
                              searchListLoading: () => _buildLoadingWidget(),
                              searchListSuccess: (searchData) {
                                return _buildSuccessWidget(context, searchData);
                              },
                              orElse: () =>
                                  _buildSuccessWidget(context, doctorsData),
                            ) ??
                            _buildSuccessWidget(context, doctorsData);
                      },
                    );
                  },
                ) ??
                Container(width: 100, height: 100, color: Colors.red),
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
          Gap(16.h),
          const SearchBarWidget().setHorizontalPadding(16.h),
          Gap(24.h),
          Column(
            children: List.generate(
              3,
              (index) => Row(
                children: [
                  const RectShimmerEffect(
                    width: 110,
                    height: 110,
                  ),
                  Gap(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RectShimmerEffect(width: 90, height: 10),
                      Gap(16.h),
                      const RectShimmerEffect(width: 90, height: 10),
                      Gap(16.h),
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

  Widget _buildSuccessWidget(BuildContext context, List<DoctorModel> doctors) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Gap(16.h),
          SearchBarWidget(
            onQueryChanged: (value) {
              context.read<SearchCubit>().search(value);
            },
            onEmptyQuery: () {
              context.read<DoctorsCubit>().getAllDoctors();
            },
            onFilterTap: () {
              _openModalBottomSheet(
                  context, context.read<DoctorsCubit>(), doctors);
            },
          ).setHorizontalPadding(16.h),
          Gap(24.h),
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
        Gap(75.h),
        SvgPicture.asset(
          "assets/images/doctors_illustration.svg",
          width: 150.w,
          height: 150.h,
        ),
        Gap(40.h),
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

  void _openModalBottomSheet(
    BuildContext context,
    DoctorsCubit doctorsCubit,
    List<DoctorModel> doctors,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: doctorsCubit,
          child: SortByBottomSheetWidget(doctors: doctors),
        );
      },
    );
  }
}
