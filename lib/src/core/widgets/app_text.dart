import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
 final TextDecoration decoration;
  const AppText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.overflow,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.height,
          this.decoration=TextDecoration.none,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? FontSize.s16,
        fontWeight: fontWeight,
        height: height,
        decoration: decoration
      ),
    );
  }
}
