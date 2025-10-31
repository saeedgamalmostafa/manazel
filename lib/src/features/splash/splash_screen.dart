import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';

import '../login/login_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  void _initApp() async {
    NotificationNavigator().init();

    NotificationService().setupNotifications();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    final isUserLoggedIn = await UserCubit.instance.init();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (isUserLoggedIn) {
          Go.pushAndRemoveUntil(const AppLayoutScreen(),
              transitionType: TransitionType.slideFromBottom);
        } else {
          Go.pushAndRemoveUntil(const LoginScreen(),
              transitionType: TransitionType.slideFromBottom);
        }
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Lottie.asset(
          AppAssets.lottie.manazelLogo.path,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
          width: AppSizes.sW250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
