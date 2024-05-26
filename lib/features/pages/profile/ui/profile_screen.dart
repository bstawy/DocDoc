import 'package:docdoc/core/helpers/extensions/extensions.dart';
import 'package:docdoc/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/text_styles.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../widgets/custom_app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<LayoutCubit>().changePage(0);
      },
      child: Container(
        color: ColorsManager.mainBlue,
        child: Column(
          children: [
            CustomAppBar(
              title: "Profile",
              titleStyle: TextStyles.font18DarkBlueBold.copyWith(
                color: Colors.white,
              ),
              leadingIconColor: Colors.white,
              actionIcon: IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 92.h),
                    padding: EdgeInsets.only(top: 92.w),
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          child: Image.asset("assets/images/profile_pic.png"),
                        ),
                        Gap(35.h),
                        Text(
                          "Bastawy",
                          style: TextStyles.font20DarkBlueSemiBold,
                        ),
                        Gap(8.h),
                        Text(
                          "b@b.com",
                          style: TextStyles.font14GreyRegular,
                        ),
                        Gap(24.h),
                        Container(
                          height: 60.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextButton(
                                  onPressed: () {},
                                  text: "My Appointments",
                                  style:
                                      TextStyles.font12DarkBlueMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: ColorsManager.lighterGrey,
                                thickness: 1,
                              ).setVerticalPadding(8.h),
                              Expanded(
                                child: CustomTextButton(
                                  onPressed: () {},
                                  text: "Medical records",
                                  style:
                                      TextStyles.font12DarkBlueMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).setHorizontalPadding(24.w),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
Center(
        child: CustomMaterialButton(
          onClicked: () async {
            final ApiService apiServices = getIt<ApiService>();

            try {
              final response = await apiServices.logout();

              if (response.code == 200) {
                HiveManager.getInstance().clearAllData();
                SecureStorage.getInstance().delete(key: "mytoken");

                if (context.mounted) {
                  context.pushNamedAndRemoveUntil(
                    Routes.onBoardingScreen,
                    predicate: ModalRoute.withName(Routes.splashScreen),
                  );
                }
              } else {
                throw Exception(response.message);
              }
            } catch (e) {
              debugPrint("Error: $e");
            }
          },
          title: 'Logout',
        ).setHorizontalPadding(40.w),
      ),
      */
