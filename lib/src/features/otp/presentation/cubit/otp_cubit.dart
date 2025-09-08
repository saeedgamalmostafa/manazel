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

  Future<void> verifyOtp() async {
    final result = await baseCrudUseCase<UserModel>(
      CrudBaseParams(
        api: ApiConstants.verifyOtp,
        httpRequestType: HttpRequestType.post,
        body: {'code': codeController.text, 'type': 'client'},
        mapper: (value) => UserModel.fromJson(value),
      ),
    );
    result.when(
      (response) {
        if (response.data!.isNotEmpty) {
          UserCubit.instance.setUserLoggedIn(
              user: response.data!.first,
              token: response.data!.first.accessToken ?? '');
          Go.pushAndRemoveUntil(
            const AppLayoutScreen(),
            transitionType: TransitionType.slideFromRight,
          );
        }
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }
}
