import 'package:flutter/material.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/extensions/context_extension.dart';

import '../../config/res/app_sizes.dart';

class InternetExpetion extends StatelessWidget {
  const InternetExpetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppAssets.lottie.noInternet.lottie(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .3,
            ),
            SizedBox(height: AppSize.sH10),
            Text(
              LocaleKeys.errorExeptionNoconnection,
              style: context.textTheme.titleLarge!.copyWith(
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: AppSize.sH10),
            Text(
              LocaleKeys.errorexeptionNointernetdesc,
              style: context.textTheme.titleLarge!.copyWith(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.sH10),
          ],
        ),
      ),
    );
  }
}
