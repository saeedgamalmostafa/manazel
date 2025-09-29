import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/features/otp/presentation/cubit/otp_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpForms extends StatelessWidget {
  const OtpForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        length: 4,
        controller: context.read<OtpCubit>().codeController,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        autoDismissKeyboard: true,
        backgroundColor: Colors.transparent,
        keyboardType: TextInputType.number,
        hintCharacter: '-',
        enableActiveFill: false,
        pinTheme: PinTheme(
          activeColor: AppColors.primary,
          activeBorderWidth: 1,
          selectedBorderWidth: 1,
          borderRadius: BorderRadius.circular(16.r),
          inactiveBorderWidth: 1,
          inactiveFillColor: AppColors.white,
          selectedColor: AppColors.primary,
          inactiveColor: AppColors.whiteGrey.withAlpha(40),
          activeFillColor: AppColors.white,
          selectedFillColor: AppColors.white,
          shape: PinCodeFieldShape.box,
          fieldWidth: 62.w,
          fieldHeight: 60.h,
        ),
        textStyle: const TextStyle(color: AppColors.primary),
        onCompleted: (value) => FocusScope.of(context).unfocus(),
        onChanged: (value) {},
      ),
    );
  }
}
