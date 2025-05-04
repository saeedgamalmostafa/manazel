import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/color_manager.dart';

import '../../../config/language/locale_keys.g.dart';
import '../buttons/custom_elevated_button.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
            color: AppColors.white,
            width: double.infinity,
            height: 105.h,
          child: CustomElevatedButton(onPressed: () {},
              text: LocaleKeys.confirm.tr()),
          padding: EdgeInsets.all(40),



          ),

    );
  }
}
