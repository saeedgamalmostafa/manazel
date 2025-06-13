import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

import '../../../config/res/color_manager.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.width,
    this.color,
  });

  final Function() onPressed;
  final String text;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
          minimumSize:
              WidgetStatePropertyAll(Size(width ?? double.infinity, 52.h)),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: color == null ? BorderSide.none : BorderSide(color: color!),
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppRadius.bR8)))),
      child: CustomText.titleSmall(text,
          textStyle: textStyle ??
              Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w500)),
    );
  }
}
