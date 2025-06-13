import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';

import '../../config/res/color_manager.dart';
import '../navigator/app_navigator.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: AppSizes.sW16),
      child: InkWell(
        onTap: () => Go.pop(),
        borderRadius: BorderRadius.circular(AppRadius.bR100),
        // onTap: () => Go.pop(),
        child: Container(
          alignment: Alignment.centerRight,
          clipBehavior: Clip.antiAlias,
          height: AppSizes.sH40,
          width: AppSizes.sW40,
          //margin: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
