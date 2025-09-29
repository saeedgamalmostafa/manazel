import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/cache_service.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/core/widgets/default_bottom_sheet.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';
import 'package:manazel/src/features/change_phone/change_phone_imports.dart';
import 'package:manazel/src/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/helpers/request_state.dart';

part 'otp_state.dart';

class OtpCubit extends AsyncCubit {
  OtpCubit() : super(null);

  final codeController = TextEditingController();
  late String phone;
  late OtpType otpType;
  final UserCubit userCubit = UserCubit.instance;
  Future<void> verifyOtp() async {
    switch (otpType) {
      case OtpType.auth:
        await verifyAuth();
      case OtpType.changePhone:
        await verifyNewPhone();
    }
  }

  Future<void> verifyAuth() async {
    final result = await baseCrudUseCase<UserModel>(CrudBaseParams(
        api: ApiConstants.verifyOtp,
        httpRequestType: HttpRequestType.post,
        body: {'code': codeController.text, 'type': 'client'},
        mapper: (json) => UserModel.fromJson(json['user'])));
    result.when(
      (response) {
        UserCubit.instance.setUserLoggedIn(
            user: response.data!, token: response.data!.accessToken ?? '');
        Go.pushAndRemoveUntil(
          const AppLayoutScreen(),
          transitionType: TransitionType.slideFromRight,
        );
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }

  Future<void> verifyNewPhone() async {
    final result = await baseCrudUseCase<UserModel>(CrudBaseParams(
        api: ApiConstants.verfiyNewPhone,
        httpRequestType: HttpRequestType.post,
        body: {'code': codeController.text, 'type': 'client', "mobile": phone},
        mapper: (json) => UserModel.fromJson(json['user'])));
    result.when(
      (response) async {
        await userCubit.updateUser(response.data!);
        await userCubit.setToken(response.data?.accessToken ?? '');
        showDefaultBottomSheet(child: const ChangePhoneBottomSheet());
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }

  Future<void> refreshToken() async {
    final oldToken = await SecureStorage.read('token');
    final result = await baseCrudUseCase<UserToken>(
      CrudBaseParams(
        api: ApiConstants.refreshToken,
        httpRequestType: HttpRequestType.post,
        body: {'token': oldToken, 'type': 'client', "forceChange": 1},
        mapper: (json) => UserToken.fromJson(json),
      ),
    );

    result.when(
      (response) async {
        userCubit.setToken(response.data?.token ?? '');
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }

  Future<void> sendCode() async {
    setLoading();
    final result = await baseCrudUseCase<UserAuthModel>(
      CrudBaseParams(
        api: ApiConstants.sendOtp,
        httpRequestType: HttpRequestType.post,
        body: sendCodeBody(),
        mapper: (value) => UserAuthModel.fromJson(value),
      ),
    );
    result.when(
      (response) {
        setSuccess(data: response.data);
        showSuccessToast('code is : ${response.data?.verificationCode}');
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }

  Map<String, dynamic> sendCodeBody() {
    switch (otpType) {
      case OtpType.auth:
        return {
          'mobile': phone,
        };
      case OtpType.changePhone:
        return {
          'mobile': userCubit.user.mobile,
          'new_mobile': phone,
        };
    }
  }
}

enum OtpType { auth, changePhone }

class UserToken {
  final String token;

  UserToken({
    required this.token,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      token: json['token'].toString(),
    );
  }
}
