import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';

import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/core/widgets/custom_language_radio_list_tile.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';

enum ScreenType { setting, auth }

changeLanguageBottomSheet(ScreenType screenType) {
  return showModalBottomSheet(
    context: Go.navigatorKey.currentContext!,
    builder: (context) => _ModelSheet(screenType: screenType),
  );
}

class _ModelSheet extends StatefulWidget {
  final ScreenType screenType;
  const _ModelSheet({required this.screenType});

  @override
  _ModelSheetState createState() => _ModelSheetState();
}

class _ModelSheetState extends State<_ModelSheet> {
  late Locale _selectedLocale;

  @override
  void initState() {
    super.initState();
    _selectedLocale = Go.navigatorKey.currentContext!.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sW25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.sH25, bottom: AppSizes.sH15),
            child: CustomRadioListTile<Locale>(
              value: const Locale('ar'),
              groupValue: _selectedLocale,
              onChanged: (value) {
                setState(() {
                  _selectedLocale = value!;
                });
              },
              title: "العربية",
              imagePath: AppAssets.svg.saudiSquareFlag.path,
            ),
          ),
          CustomRadioListTile<Locale>(
            value: const Locale('en'),
            groupValue: _selectedLocale,
            onChanged: (value) {
              setState(() {
                _selectedLocale = value!;
              });
            },
            title: "English",
            imagePath: AppAssets.svg.americaFlag.path,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.sH15),
            child: CustomElevatedButton(
              onPressed: () {
                context.setLocale(_selectedLocale);
                switch (widget.screenType) {
                  case ScreenType.setting:
                    Go.pushAndRemoveUntil(const AppLayoutScreen());
                    break;
                  case ScreenType.auth:
                    Go.pop();
                    break;
                }
              },
              text: LocaleKeys.confirm.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
