import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/change_language_bottom_sheet.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

import '../../config/res/app_sizes.dart';

class AuthLanguageStatusButton extends StatelessWidget {
  const AuthLanguageStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO : Add change language bottom sheet.
    /// TODO : Change text and image of flag depending on current local.
    return InkWell(
      onTap: () => changeLanguageBottomSheet(),
      child: Container(
        height: AppSizes.sH28,
        margin: EdgeInsetsDirectional.only(end: AppSizes.sW24),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.sW6),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(AppRadius.bR15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText.titleMedium(
              Languages.currentLanguage.locale == const Locale("ar")
                  ? LocaleKeys.arabic.tr()
                  : LocaleKeys.english.tr(),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.white, fontSize: FontSize.s14),
            ),
            SizedBox(width: AppSizes.sW6),
            Languages.currentLanguage.locale == const Locale("ar")
                ? AppAssets.svg.saudiSquareFlag
                    .svg(height: AppSizes.sH12, width: AppSizes.sW16)
                : AppAssets.svg.americaFlag
                    .svg(height: AppSizes.sH12, width: AppSizes.sW16),
          ],
        ),
      ),
    );
  }
}
