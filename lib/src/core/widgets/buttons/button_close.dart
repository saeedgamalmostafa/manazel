import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';

import '../../../config/res/color_manager.dart';

class ButtonClose extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonClose({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Go.pop(),
      child: Container(
        height: AppSizes.sH25,
        width: AppSizes.sW25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppCircular.r20),
        ),
        child: Center(
          child: Icon(
            Icons.close,
            color: AppColors.black,
            size: AppSizes.sH25,
          ),
        ),
      ),
    );
  }
}
