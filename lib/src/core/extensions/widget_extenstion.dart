import 'package:flutter/material.dart';

extension GestureDetectorExt on Widget {
  Widget withGestureDetector({
    required Function() onTap,
    Function()? onDoubleTap,
    Function()? onLongPress,
  }) {
    return GestureDetector(
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: this,
    );
  }
}
