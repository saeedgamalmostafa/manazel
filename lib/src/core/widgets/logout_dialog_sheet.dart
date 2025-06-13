import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/core/widgets/buttons/custom_outlined_button.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/color_manager.dart';

class LogoutBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon in card
              Container(
                child: Image.asset(
                  'assets/gif/54ba850821c93ade1e6c40921cfade3acd229306.gif',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 28),

              // Confirmation Text

              CustomText(LocaleKeys.do_you_want_logout.tr(),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),

              const SizedBox(height: 32),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                        width: 163.5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: LocaleKeys.yes.tr()),
                  ),

                  const SizedBox(width: 16),
                  // No Button
                  Expanded(
                      child: CustomOutlinedButton(
                          width: 163.5,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.no.tr())),

                  // Yes Button
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
