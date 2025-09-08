import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/extensions/context_extension.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';

class UnderLineTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool showLine;
  const UnderLineTextWidget({
    super.key,
    required this.text,
    this.showLine = true,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
          ).medium.s12,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            // Measure the text width
            final textPainter = TextPainter(
              text: TextSpan(
                text: text,
                style: const TextStyle(
                  color: AppColors.primary,
                ).setPrimaryColor.medium,
              ),
              textDirection: context.textDirection,
            )..layout();

            return showLine
                ? Container(
                    width: textPainter.width,
                    height: 1.h,
                    color: color,
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
