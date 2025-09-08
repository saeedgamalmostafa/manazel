import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/buttons/loading_button.dart';

class BottomButton extends StatelessWidget {
  final Future<void> Function() onTap;
  const BottomButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.sW16,
        vertical: AppSizes.sH16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30), // shadow color
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 0), // horizontal, vertical movement
          ),
        ],
      ),
      child: Center(
        child: LoadingButton(
          margin: EdgeInsets.zero,
          onTap: onTap,
          title: LocaleKeys.confirm,
        ),
      ),
    );
  }
}
