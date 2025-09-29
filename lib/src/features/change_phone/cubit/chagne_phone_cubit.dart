import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';
import 'package:manazel/src/features/otp/presentation/cubit/otp_cubit.dart';

class ChagnePhoneCubit extends AsyncCubit<UserAuthModel?> with LoginContrlers {
  ChagnePhoneCubit() : super(null);

  Future<void> changeMobiel() async {
    if (!formKey.currentState!.validate()) return;

    final result = await baseCrudUseCase<UserAuthModel>(CrudBaseParams(
        api: ApiConstants.changeMobile,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+966${phoneController.text}',
          'type': 'client',
        },
        mapper: (json) => UserAuthModel.fromJson(json['user'])));
    result.when(
      (response) {
        final token = response.data?.accessToken;

        if (token != null) {
          UserCubit.instance.setToken(token);
        }
        Go.push(
          OtpScreen(
            otpType: OtpType.changePhone,
            phone: '+966${phoneController.text}',
          ),
          transitionType: TransitionType.slideFromRight,
        );
        showSuccessToast('code : ${response.data?.verificationCode}');
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );
  }
}

mixin LoginContrlers {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
}
