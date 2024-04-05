import 'package:flutter/material.dart';

import 'core/config/routing/app_router.dart';
import 'core/di/dependency_injection.dart';
import 'doc_doc_app.dart';

/// Use command  "flutter run --release -t lib/main_development.dart --flavor development" to run the app in production mode

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(DocDocApp(appRouter: AppRouter()));
}