import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';

import '../../config/res/color_manager.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        color: AppColors.white,
        constraints: BoxConstraints(
          maxHeight: AppSizes.sH24,
          maxWidth: AppSizes.sW24,
        ),
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.white)),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primary,
        ));
  }
}
