import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.fillColor,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.style,
    this.focusNode,
    this.enabledBorder,
    this.inputDecoration,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final Color? fillColor;
  final OutlineInputBorder? enabledBorder;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.done,
      textAlignVertical: TextAlignVertical.center,
      cursorOpacityAnimates: true,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: obscureText,
      style: style ??
          Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.black, fontSize: AppSizes.sW16),
      keyboardType: textInputType ?? TextInputType.name,
      decoration: inputDecoration ??
          InputDecoration(
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.bR8),
                    borderSide: BorderSide(
                        color: AppColors.grey.withValues(alpha: 0.35),
                        width: AppRadius.bR2_5 / 2)),
            contentPadding: EdgeInsets.symmetric(
                vertical: AppRadius.bR15, horizontal: AppRadius.bR10),
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.grey),
            labelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primary),
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      //  ),
    );
  }
}
