import 'package:flutter/material.dart';

import '../../../features/login/ui/login_screen.dart';
import '../../../features/on_boarding/on_boarding_screen.dart';
import '../../../features/register/ui/register_screen.dart';
import '../../../features/splash/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteDefinedWidget(settings: settings),
        );
    }
  }
}

class NoRouteDefinedWidget extends StatelessWidget {
  final RouteSettings settings;
  const NoRouteDefinedWidget({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "No Route Defined for ${settings.name}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
