import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';

import '../../../config/res/assets.gen.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
           horizontal: AppSizes.sW62,vertical: AppSizes.sH38),
        child: Image.asset(AppAssets.png.manazelPrimaryLogoName.path,
          height: AppSizes.sH33,
          width: AppSizes.sW250,));
  }
}
