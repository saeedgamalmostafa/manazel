import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

import '../../../config/res/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.width,
    this.color,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(

          maximumSize:
          WidgetStatePropertyAll(Size(width ?? double.infinity, 48.h)),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: color == null ? BorderSide.none : BorderSide(color: color!),
              borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadius.bR10)))),
      child: CustomText.titleSmall(text,
          textStyle: textStyle ??
              Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.white)),
    );
  }
}