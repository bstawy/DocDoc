import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/login/ui/login_screen.dart';
import '../../../features/auth/register/ui/register_screen.dart';
import '../../../features/layout/logic/layout_cubit.dart';
import '../../../features/layout/ui/layout_screen.dart';
import '../../../features/on_boarding/on_boarding_screen.dart';
import '../../../features/pages/home/ui/pages/specialities/logic/specialities_cubit.dart';
import '../../../features/pages/home/ui/pages/specialities/ui/specialities_screen.dart';
import '../../../features/splash/splash_screen.dart';
import '../../di/dependency_injection.dart';
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

      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LayoutCubit(),
            child: const LayoutScreen(),
          ),
        );

      case Routes.specialitiesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SpecialitiesCubit>(),
            child: const SpecialitiesScreen(),
          ),
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
