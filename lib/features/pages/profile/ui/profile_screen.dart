import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/caching/hive_manager.dart';
import '../../../../core/caching/secure_storage_factory.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/text_styles.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/networking/api_service/api_service.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../widgets/custom_app_bar_widget.dart';
import 'widgets/appointments_and_records_buttons_widget.dart';
import 'widgets/profile_item_widget.dart';

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
        child: SingleChildScrollView(
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
              SizedBox(
                height: 1.sh - 92.h,
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
                          Gap(24.h),
                          Text(
                            "Bastawy",
                            style: TextStyles.font20DarkBlueSemiBold,
                          ),
                          Text(
                            "b@b.com",
                            style: TextStyles.font14LightGreyRegular,
                          ),
                          Gap(24.h),
                          const AppointmentsAndRecordsButtons(),
                          Gap(24.h),
                          ProfileItem(
                            title: "Personal Information",
                            iconPath:
                                "assets/icons/profile_personal_card_icon.svg",
                            onTap: () {},
                          ),
                          ProfileItem(
                            title: "My Test & Diagnostic",
                            iconPath: "assets/icons/profile_report_icon.svg",
                            onTap: () {},
                          ),
                          ProfileItem(
                            title: "Payment",
                            iconPath: "assets/icons/profile_payment_icon.svg",
                            onTap: () {},
                          ),
                          CustomMaterialButton(
                            onClicked: () async {
                              final ApiService apiServices =
                                  getIt<ApiService>();

                              try {
                                final response = await apiServices.logout();

                                if (response.code == 200) {
                                  HiveManager.getInstance().clearAllData();
                                  SecureStorage.getInstance()
                                      .delete(key: "mytoken");

                                  if (context.mounted) {
                                    context.pushNamedAndRemoveUntil(
                                      Routes.onBoardingScreen,
                                      predicate: ModalRoute.withName(
                                          Routes.splashScreen),
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
                        ],
                      ).setHorizontalPadding(24.w),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
