import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/features/login/login_imports.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      // Adjust duration to match your animation
      vsync: this,
    );

    // Listen for animation completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Go.pushAndRemoveUntil(const LoginScreen(), transitionType: TransitionType.slideFromBottom);
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
      backgroundColor: AppColors.primary, // Set your preferred background color
      body: Center(
        child: Lottie.asset(
          AppAssets.lottie.manazelLogo.path, // Your Lottie file path
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
