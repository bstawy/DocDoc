import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/caching/hive_manager.dart';
import 'core/config/routing/app_router.dart';
import 'core/di/dependency_injection.dart';
import 'doc_doc_app.dart';

/// Use command  "flutter run --release -t lib/main_development.dart --flavor development"
/// to run the app in production mode
///
/// Use command  "flutter build apk --flavor Development -t lib/main_development.dart"
/// to build APK in DEVELOPMENT mode

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4CAF50),
      systemNavigationBarColor: Color(0xFF4CAF50),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  initGetIt();

  Future.wait([
    getIt<HiveManager>().init(),
  ]).then((_) {
    runApp(DocDocApp(
      isDevFlavor: true,
      appRouter: AppRouter(),
    ));
  });
}
