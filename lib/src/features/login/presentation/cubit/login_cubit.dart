import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../../../core/helpers/request_state.dart';
import '../../domain/entitiy/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState());

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  Future<void> login() async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      final user = await _loginUseCase(LoginUseCaseParams(
          phone: state.phone, type: "client", fcmToken: "fcmToken"));
      emit(state.copyWith(requestState: RequestState.success, user: user));
    } catch (e) {
      emit(state.copyWith(
          requestState: RequestState.error, error: e.toString()));
    }
  }
}
