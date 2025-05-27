import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manazel/src/features/register/domain/entitiy/register_user.dart';
import 'package:manazel/src/features/register/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/request_state.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _registerUsecase;

  RegisterCubit(this._registerUsecase) : super(RegisterState());

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void onEmailChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void onNameChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  Future<void> register() async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      final user = await _registerUsecase(RegisterUseCaseParams(
          phone: state.phone, type: "client", fcmToken: "fcmToken", name: state.name, email: state.email));
      emit(state.copyWith(requestState: RequestState.success, user: user));
    } catch (e) {
      emit(state.copyWith(
          requestState: RequestState.error, error: e.toString()));
    }
  }
}
