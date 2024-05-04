import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/caching/hive_manager.dart';
import '../../../../core/caching/secure_storage_factory.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/networking/api_service/api_service.dart';
import '../../../../core/widgets/custom_material_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
        title: 'LogOut',
      ).setHorizontalPadding(40.w),
    );
  }
}
