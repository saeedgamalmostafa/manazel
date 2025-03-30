import 'package:flutter/material.dart';
import 'package:manazel/src/core/navigation/constants/imports_constants.dart';

import '../../factory/transition_creator.dart';
import 'Animator/rotation_animator.dart';
import 'Option/rotation_animation_option.dart';

class RotationTransitionAnimation implements TransitionCreator {
  final RotationAnimationOptions options;

  const RotationTransitionAnimation({
    required this.options,
  });

  @override
  Widget animate(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    /// Primary animation

    return RotationTransition(
      turns: RotationAnimator(options).animator(animation),
      alignment: options.alignment,
      filterQuality: options.filterQuality,
      child: child,
    ).buildSecondaryTransition(
        animation: animation,
        applySecondaryTransition: options.secondaryTransition);
  }
}
