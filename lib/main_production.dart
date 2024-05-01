import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/caching/hive_manager.dart';
import 'core/config/routing/app_router.dart';
import 'core/di/dependency_injection.dart';
import 'doc_doc_app.dart';

/// Use command  "flutter run --release -t lib/main_production.dart --flavor production"
/// to run the app in production mode
///
/// Use command  "flutter build apk --flavor Production -t lib/main_production.dart"
/// to build APK in PRODUCTION mode

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ),
  );

  initGetIt();

  Future.wait([
    getIt<HiveManager>().init(),
  ]).then((_) {
    runApp(DocDocApp(appRouter: AppRouter()));
  });
}
