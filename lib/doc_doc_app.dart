import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/routing/app_router.dart';
import 'core/config/routing/routes.dart';
import 'core/config/theme/theme_data/app_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DocDocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocDocApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'DocDoc',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThemeData,
        navigatorKey: navigatorKey,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashScreen,
        builder: BotToastInit(),
      ),
    );
  }
}
