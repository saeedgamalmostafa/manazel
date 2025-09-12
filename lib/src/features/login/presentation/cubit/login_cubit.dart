import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';

class LoginCubit extends AsyncCubit<BaseModel?> with LoginContrlers {
  LoginCubit() : super(null);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    setLoading();
    injector<NetworkService>().removeToken();

    final result = await baseCrudUseCase<List<UserAuthModel>>(
      CrudBaseParams(
        api: ApiConstants.login,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+966${phoneController.text}',
          'cloud_messaging_token': ConstantManager.token,
          'type': 'client',
        },
        mapper: (json) =>
            (json as List).map((e) => UserAuthModel.fromJson(e)).toList(),
      ),
    );

    result.when(
      (response) {
        final token = response.data?.first.accessToken;

        if (token != null) {
          injector<NetworkService>().setToken(token);
        }

        Go.push(
          OtpScreen(
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
      isActive: json['is_active'] == true,
    );
  }
}
