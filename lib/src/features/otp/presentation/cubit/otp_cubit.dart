import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';

import '../../../../core/helpers/request_state.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(const OtpState()) {
    baseCrudUseCase = injector();
  }
  final codeController = TextEditingController();
  late final BaseCrudUseCase baseCrudUseCase;
  late String phone;

  Future<void> verifyOtp() async {
    final result = await baseCrudUseCase<List<UserModel>>(
      CrudBaseParams(
        api: ApiConstants.verifyOtp,
        httpRequestType: HttpRequestType.post,
        body: {'code': codeController.text, 'type': 'client'},
        mapper: (json) =>
            (json as List).map((e) => UserModel.fromJson(e)).toList(),
      ),
    );
    result.when(
      (response) {
        UserCubit.instance.setUserLoggedIn(
            user: response.data!.first,
            token: response.data!.first.accessToken ?? '');
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

  Future<void> resendCode() async {
    emit(state.copyWith(verificationState: RequestState.loading));
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
        emit(state.copyWith(verificationState: RequestState.success));

        showSuccessToast(response.msg);
      },
      (error) {
        emit(state.copyWith(verificationState: RequestState.error));

        showErrorToast(error.message);
      },
    );
  }
}
