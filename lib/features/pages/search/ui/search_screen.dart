import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/config/theme/texts/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/helpers/shimmer_loading_effect/rect_shimmer_effect.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../home/data/models/doctor_model.dart';
import '../../home/ui/widgets/doctor_widget.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/section_header_widget.dart';
import '../logic/search_cubit.dart';
import '../logic/search_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<LayoutCubit>().changePage(0);
      },
      child: Column(
        children: [
          const CustomAppBar(
            title: "Search",
          ),
          Gap(16.h),
          SearchBarWidget(
            onQueryChanged: (value) {
              context.read<SearchCubit>().search(value);
            },
            onEmptyQuery: () {
              context.read<SearchCubit>().getInitialState();
            },
            onFilterTap: () {},
          ).setHorizontalPadding(16.h),
          BlocBuilder<SearchCubit, SearchStates>(
            bloc: context.read<SearchCubit>(),
            builder: (context, state) {
              return RefreshIndicator(
                color: ColorsManager.mainBlue,
                onRefresh: () async {
                  if (state != const SearchStates.initial()) {
                    context.read<SearchCubit>().getInitialState();
                  }
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: state.whenOrNull(
                        initial: () => _buildInitialWidget(context),
                        searchListLoading: () => _buildLoadingWidget(),
                        searchListSuccess: (data) =>
                            _buildSuccessWidget(context, data),
                      ) ??
                      const SizedBox(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInitialWidget(BuildContext context) {
    context.read<SearchCubit>().getSearchHistory();
    List<String> searchHistory = context.read<SearchCubit>().searchHistory;

    return SizedBox(
      height: 0.7.sh,
      child: ListView(
        children: [
          Gap(24.h),
          SectionHeader(
            title: "Recent Searches",
            actionText: "Clear all history",
            onActionTap: () {
              context.read<SearchCubit>().clearAllSearchHistory();
            },
          ).setHorizontalPadding(16.h),
          // Gap(16.h),
          Column(
            children: List.generate(
              searchHistory.length,
              (index) => ListTile(
                leading: const Icon(
                  Icons.history_toggle_off,
                  color: ColorsManager.grey,
                ),
                title: Text(
                  searchHistory[index],
                  style: TextStyles.font14GreyRegular,
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<SearchCubit>().clearHistoryItem(index);
                  },
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                  icon: const Icon(
                    Icons.close,
                    color: ColorsManager.grey,
                  ),
                ),
              ),
            ),
          ).setOnlyPadding(0, 0, 8.w, 16.w),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      height: 0.7.sh,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => RectShimmerEffect(
                    width: 100.w,
                    height: 40.h,
                    borderRadius: 50.r,
                  ),
                ),
              ),
              RectShimmerEffect(
                width: 100.w,
                height: 20.h,
              ).setVerticalPadding(24.h),
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
              ),
            ],
          ).setHorizontalPadding(16.h),
        ],
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context, List<DoctorModel> doctors) {
    return SizedBox(
      height: 0.733.sh,
      child: ListView(
        children: [
          doctors.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => RectShimmerEffect(
                          width: 100.w,
                          height: 40.h,
                          borderRadius: 50.r,
                        ),
                      ),
                    ).setHorizontalPadding(16.w),
                    SectionHeader(
                      title: "${doctors.length} founds",
                    ).setHorizontalAndVerticalPadding(16.w, 16.h),
                    Column(
                      children: List.generate(
                        doctors.length,
                        (index) => DoctorWidget(
                          doctor: doctors[index],
                        ),
                      ),
                    ),
                  ],
                )
              : _buildEmptyWidget(),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
      ).setHorizontalPadding(32.w),
    );
  }
}
