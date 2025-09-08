import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';

import '../navigator/app_navigator.dart' show Go;

showToast(String? message, {Color? bg}) {
  Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bg ?? Colors.black,
      textColor: Colors.white,
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2);
}

showErrorToast(String message) {
  if (Go.navigatorKey.currentContext != null) {
    Flushbar(
      borderRadius: BorderRadius.circular(16.r),
      margin: EdgeInsets.all(20.sp),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      messageText: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
          ).medium.copyWith(fontSize: 12),
        ),
      ),
      backgroundColor: AppColors.error,
    ).show(Go.navigatorKey.currentContext!);
    // showToast(message, bg: AppColors.alert);
  }
}

bool isShow = false;
Flushbar? flushbar;

Future<void> showSuccessToast(String message) async {
  if (Go.navigatorKey.currentContext != null) {
    if (flushbar?.isShowing() ?? false) {
      flushbar?.dismiss();
    }

    flushbar = Flushbar(
        borderRadius: BorderRadius.circular(16.r),
        margin: EdgeInsets.all(20.sp),
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        messageText: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
            ).medium.copyWith(fontSize: 12),
          ),
        ),
        backgroundColor: Colors.green);
    flushbar?.show(Go.navigatorKey.currentContext!);
  }
  // showToast(message, bg: AppColors.primaryGradient.colors);
}
