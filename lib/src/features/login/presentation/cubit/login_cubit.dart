import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../domain/entitiy/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login(LoginUseCaseParams loginUseCaseParams) async {
    try {
      emit(LoginLoading());
      final user = await _loginUseCase(loginUseCaseParams);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
