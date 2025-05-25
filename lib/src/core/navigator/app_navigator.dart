import 'package:flutter/material.dart';

enum TransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromTop,
  slideFromBottom,
}

class Go {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static PageRouteBuilder<dynamic> _buildPageRoute(
      Widget page,
      TransitionType transitionType,
      ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case TransitionType.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.slideFromTop:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.slideFromBottom:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case TransitionType.fade:
            return FadeTransition(
              opacity: animation,
              child: child,
            );
        }
      },
    );
  }

  static Future<dynamic> push(
      Widget page, {
        TransitionType transitionType = TransitionType.fade,
      }) {
    return navigatorKey.currentState!.push(
      _buildPageRoute(page, transitionType),
    );
  }

  static Future<dynamic> pushReplacement(
      Widget page, {
        TransitionType transitionType = TransitionType.fade,
      }) {
    return navigatorKey.currentState!.pushReplacement(
      _buildPageRoute(page, transitionType),
    );
  }

  static Future<dynamic> pushAndRemoveUntil(
      Widget page, {
        TransitionType transitionType = TransitionType.fade,
      }) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      _buildPageRoute(page, transitionType),
          (route) => false,
    );
  }

  static void pop() {
    navigatorKey.currentState!.pop();
  }
}
