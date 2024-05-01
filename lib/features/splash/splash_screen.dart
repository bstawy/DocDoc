import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/caching/secure_storage_factory.dart';
import '../../core/config/routing/routes.dart';
import '../../core/helpers/extensions/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isAnimationDone = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward().then(
        (value) async {
          String mytoken =
              await SecureStorage.getInstance().read(key: "mytoken") ?? "";

          if (mytoken.isNotEmpty) {
            if (mounted) {
              Navigator.pushReplacementNamed(context, Routes.layoutScreen);
            }
          } else {
            if (mounted) {
              context.pushReplacementNamed(Routes.onBoardingScreen);
            }
          }
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animation/docdoc_animated_splash_logo.json",
        ),
      ),
    );
  }
}
