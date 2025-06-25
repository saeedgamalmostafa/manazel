import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/res/app_sizes.dart';

class OtpForms extends StatelessWidget {
  const OtpForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.sH24,horizontal: AppSizes.sW40).copyWith(top: AppSizes.sH32),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          appContext: context,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          length: 4,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          autoDismissKeyboard: true,
          backgroundColor: Colors.transparent,
          keyboardType: TextInputType.number,
          enableActiveFill: true,
          pinTheme: PinTheme(
            activeColor: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.bR14),
            inactiveFillColor: AppColors.white,
            selectedColor: AppColors.primary,
            inactiveColor: AppColors.grey.withOpacity(0.3),
            activeFillColor: AppColors.white,
            selectedFillColor: AppColors.white,
            shape: PinCodeFieldShape.box,
            fieldWidth: 54.w,
            fieldHeight: 58.h,
          ),
          textStyle: const TextStyle(color: AppColors.secondary),
          onCompleted: (value) => FocusScope.of(context).unfocus(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
