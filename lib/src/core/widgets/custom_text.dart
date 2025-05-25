import 'package:flutter/material.dart';
 
import 'package:manazel/src/core/navigator/app_navigator.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      this.text, {
        super.key,
        required this.textStyle,
        this.textAlign,
        this.textDirection,
        this.overflow,
        this.maxLines,
      });

  CustomText.headlineLarge(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.headlineLarge,
  );

  CustomText.headlineMedium(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!)
            .textTheme
            .headlineMedium,
  );

  CustomText.headlineSmall(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.headlineSmall,
  );

  CustomText.titleLarge(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.titleLarge,
  );
  CustomText.titleMedium(String text, {
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
    int? maxLines,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme
            .of(Go.navigatorKey.currentContext!)
            .textTheme
            .titleMedium,
  );

  CustomText.titleSmall(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.titleSmall,
  );

  CustomText.bodySmall(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.bodySmall,
  );
  CustomText.bodyMedium(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.bodyMedium,
  );

  CustomText.bodyLarge(
      String text, {
        Key? key,
        TextAlign? textAlign,
        String? fontFamily,
        int? maxLines,
        TextStyle? textStyle,
        TextOverflow? overflow,
      }) : this(
    text,
    key: key,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    textStyle: textStyle ??
        Theme.of(Go.navigatorKey.currentContext!).textTheme.bodyLarge,
  );


  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          Theme.of(Go.navigatorKey.currentContext!).textTheme.displayMedium,
      textAlign: textAlign ?? TextAlign.center,
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}