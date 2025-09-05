import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';

class LoginCubit extends AsyncCubit<BaseModel?> with LoginContrlers {
  LoginCubit() : super(null);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    setLoading();
    final result = await baseCrudUseCase<BaseModel>(
      CrudBaseParams(
        api: ApiConstants.login,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+201007179611',
          'cloud_messaging_token': ConstantManager.token,
          'type': 'client'
        },
        mapper: (value) => BaseModel.fromMap(value),
      ),
    );
    result.when(
      (response) {
        Go.push(const OtpScreen(),
            transitionType: TransitionType.slideFromRight);
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
