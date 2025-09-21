import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/helpers.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';
import 'package:manazel/src/features/otp/presentation/cubit/otp_cubit.dart';

class LoginCubit extends AsyncCubit<UserAuthModel?> with LoginContrlers {
  LoginCubit() : super(null);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    setLoading();
    injector<NetworkService>().removeToken();

    final result = await baseCrudUseCase<UserAuthModel>(CrudBaseParams(
        api: ApiConstants.login,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+966${phoneController.text}',
          'cloud_messaging_token': NotificationService.deviceToken,
          'type': 'client',
        },
        mapper: (json) => UserAuthModel.fromJson(json['user'])));
    result.when(
      (response) {
        final token = response.data?.accessToken;

        if (token != null) {
          injector<NetworkService>().setToken(token);
        }
        Go.push(
          OtpScreen(
            otpType: OtpType.auth,
            phone: '+966${phoneController.text}',
          ),
          transitionType: TransitionType.slideFromRight,
        );
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

class UserAuthModel {
  final String verificationCode;
  final String accessToken;
  final bool isActive;

  UserAuthModel({
    required this.verificationCode,
    required this.accessToken,
    required this.isActive,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      verificationCode: json['verification_code'].toString(),
      accessToken: json['access_token'].toString(),
      isActive: json['is_active'] == false,
    );
  }
}
