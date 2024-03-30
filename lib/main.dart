import 'package:flutter/material.dart';

import 'core/config/routing/app_router.dart';
import 'doc_doc_app.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(DocDocApp(appRouter: AppRouter()));
}
