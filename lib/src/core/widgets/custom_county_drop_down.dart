import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/assets.gen.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

class CustomCountyDropDown extends StatelessWidget {
  const CustomCountyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: AppSizes.sW12),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sW8),
      width: AppSizes.sW105,
      height: 54.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.bR8),
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppAssets.svg.saudiCricularFlag.svg(),
          SizedBox(width: AppSizes.sW6),
          CustomText.titleMedium(
            "966+",
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.grey),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          )
        ],
      ),
    );
  }
}
