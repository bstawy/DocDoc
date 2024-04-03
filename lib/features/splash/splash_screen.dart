import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../core/config/routing/routes.dart';
import '../../core/helpers/extensions/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.pushReplacementNamed(Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash_background.png"),
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: RiveAnimation.asset(
              "assets/animation/splash_screen_animated.riv"),
        ),
      ),
    );
  }
}
