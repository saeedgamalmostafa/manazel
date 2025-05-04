import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/res/app_sizes.dart';
import '../../../config/res/color_manager.dart';
import '../../navigation/navigator.dart';

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:AppSizes.sW6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.sW6),
        width: AppSizes.sW40,
        height: AppSizes.sW40,
        child: OutlinedButton(
          onPressed: () {
            Go.back(); // or context.pop()
          },
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero, // Important: no extra padding
            side: const BorderSide(color: Colors.white),
            backgroundColor: Colors.white, // optional
          ),
          child: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.primary),
        ),
      ),
    )

    ;
  }
}
