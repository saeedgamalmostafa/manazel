import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';
import 'package:manazel/src/features/change_password/change_password_imports.dart';

import '../../../../core/helpers/request_state.dart';

part 'otp_state.dart';

class OtpCubit extends AsyncCubit {
  OtpCubit() : super(null);

  final codeController = TextEditingController();
  late String phone;
  late OtpType otpType;

  Future<void> verifyOtp() async {
    final result = await baseCrudUseCase<UserModel>(CrudBaseParams(
        api: ApiConstants.verifyOtp,
        httpRequestType: HttpRequestType.post,
        body: {'code': codeController.text, 'type': 'client'},
        mapper: (json) => UserModel.fromJson(json['user'])));
    result.when(
      (response) {
        switch (otpType) {
          case OtpType.auth:
            UserCubit.instance.setUserLoggedIn(
                user: response.data!, token: response.data!.accessToken ?? '');
            Go.pushAndRemoveUntil(
              const AppLayoutScreen(),
              transitionType: TransitionType.slideFromRight,
            );
            break;
          case OtpType.canCangePhone:
            injector<NetworkService>()
                .setToken(response.data!.accessToken ?? '');
            Go.pushAndRemoveUntil(
              const ChangePhoneScreen(),
              transitionType: TransitionType.slideFromRight,
            );
            break;
          case OtpType.changePhone:
            UserCubit.instance.setUserLoggedIn(
                user: response.data!, token: response.data!.accessToken ?? '');
            break;
        }
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }

  Future<void> sendCode() async {
    setLoading();
    final result = await baseCrudUseCase(
      CrudBaseParams(
        api: ApiConstants.sendOtp,
        httpRequestType: HttpRequestType.post,
        body: {'mobile': phone},
        mapper: (value) => {},
      ),
    );
    result.when(
      (response) {
        setSuccess(data: response);
        showSuccessToast(response.msg);
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }
}

enum OtpType { auth, canCangePhone, changePhone }
