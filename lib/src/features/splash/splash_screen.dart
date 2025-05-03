import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/features/login/login_imports.dart';

import '../../core/navigation/navigator.dart';

//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     _initApp();
//     super.initState();
//   }
//
//   void _initApp() async {
//     // NotificationNavigator(
//     //   onRoutingMessage: (message) {
//     //     NotificationRoutes.navigateByType(message.data);
//     //   },
//     //   onNoInitialMessage: () {
//     //     Go.offAll(const HomeScreen()); // TODO Default Route when no notification
//     //   },
//     // ); // TODO add notification navigator
//     // await ConstantManager.serviceLocator<NotificationService>()
//     //     .setupNotifications(); //TODO add notification service
//
//     // Navigator.of(context).push(
//     //   MaterialPageRoute(builder: (context) => const LoginScreen()),
//     // );
//
//     Future.delayed(
//         const Duration(seconds: 5), () => Go.offAll(const LoginScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.primary,
//       height: 1.sh,
//       width: 1.sw,
//       child: Center(
//         child: Lottie.asset(
//           AppAssets.lottie.manazelLogo.path,
//         ),
//       ),
//     );
//   }
// }

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
        Go.offAll(const LoginScreen());
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
