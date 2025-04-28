import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

import '../../config/res/app_sizes.dart';

class AuthLanguageStatusButton extends StatelessWidget {
  const AuthLanguageStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO : Add change language bottom sheet.
    /// TODO : Change text and image of flag depending on current local.
    return Container(
      height: AppSizes.sH28,
      width: AppSizes.sW70,
      margin: EdgeInsetsDirectional.only(end: AppSizes.sW24),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(AppRadius.bR15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.titleMedium(
            LocaleKeys.confirm.tr(),
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.white, fontSize: FontSize.s14),
          ),
          SizedBox(width: AppSizes.sW6),
          AppAssets.svg.saudiSquareFlag
              .svg(height: AppSizes.sH12, width: AppSizes.sW16),
        ],
      ),
    );
  }
}
