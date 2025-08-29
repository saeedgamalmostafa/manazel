import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';

import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/widgets/buttons/custom_elevated_button.dart';
import 'package:manazel/src/core/widgets/custom_language_radio_list_tile.dart';

changeLanguageBottomSheet() {
  return showModalBottomSheet(
    context: Go.navigatorKey.currentContext!,
    builder: (context) => const _ModelSheet(),
  );
}

class _ModelSheet extends StatefulWidget {
  const _ModelSheet();

  @override
  _ModelSheetState createState() => _ModelSheetState();
}

class _ModelSheetState extends State<_ModelSheet> {
  late Locale _selectedLocale;

  @override
  void initState() {
    super.initState();
    // خزن اللغة الحالية كـ Locale
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
                context.setLocale(_selectedLocale); // غيّر اللغة
                Go.pop(); // اقفل الـ bottom sheet
              },
              text: LocaleKeys.confirm.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
