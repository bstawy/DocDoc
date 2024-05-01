import 'package:flutter/material.dart';

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
  initGetIt();
  runApp(DocDocApp(appRouter: AppRouter()));
}
