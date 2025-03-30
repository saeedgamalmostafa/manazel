import 'package:manazel/src/core/navigation/constants/imports_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../factory/transition_creator.dart';
import 'Animator/scale_animator.dart';
import 'Options/scale_animation_option.dart';

class ScaleTransitionAnimation implements TransitionCreator {
  final ScaleAnimationOptions options;
  const ScaleTransitionAnimation(
      {this.options = const ScaleAnimationOptions()});

  @override
  Widget animate(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: ScaleAnimator(options).animator(animation),
      child: child,
    ).buildSecondaryTransition(
        animation: animation,
        applySecondaryTransition: options.secondaryTransition);
  }
}
