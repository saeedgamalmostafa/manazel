import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/request_state.dart';
import '../../../../core/shared/cubits/user_cubit/user_cubit.dart';
import '../../../../core/shared/models/user_model.dart';
import '../../domain/user_case/verify_otp_params.dart';
import '../../domain/user_case/verify_otp_usecase.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final VerifyOtpUseCase _verifyOtpUseCase;
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;

  OtpCubit({
    required VerifyOtpUseCase verifyOtpUseCase,
    required UserCubit userCubit,
  })  : _verifyOtpUseCase = verifyOtpUseCase,
        _userCubit = userCubit,
        super(const OtpState()) {
    _userSubscription = _userCubit.stream.listen((userState) {
      if (userState.userStatus == UserStatus.loggedIn) {
        emit(state.copyWith(
          verificationState: RequestState.success,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  void onVerificationCodeChanged(String code) {
    emit(state.copyWith(verificationCode: code));
  }

  Future<void> verifyOtp() async {
    if (state.verificationCode.length != 6) {
      emit(state.copyWith(
        verificationState: RequestState.error,
        verificationError: 'Please enter a valid 6-digit code',
      ));
      return;
    }

    try {
      emit(state.copyWith(
        verificationState: RequestState.loading,
        verificationError: '',
      ));

      final result = await _verifyOtpUseCase(VerifyOtpParams(
        code: state.verificationCode,
      ));

      result.when(
            (userResponse) {
          if (userResponse.data.accessToken.isNotEmpty) {
            _userCubit.setUserLoggedIn(
              user: UserModel(
                id: userResponse.data.id,
                name: userResponse.data.name,
                mobile: userResponse.data.mobile,
                accessToken: userResponse.data.accessToken,
                isActive: userResponse.data.isActive,
              ),
              token: userResponse.data.accessToken,
            );
          } else {
            emit(state.copyWith(
              verificationState: RequestState.error,
              verificationError: 'Verification failed. Please try again.',
            ));
          }
        },
            (failure) {
          emit(state.copyWith(
            verificationState: RequestState.error,
            verificationError: failure.message,
          ));
        },
      );
    } catch (_) {
      emit(state.copyWith(
        verificationState: RequestState.error,
        verificationError: 'An error occurred. Please try again.',
      ));
    }
  }

  void resetVerification() {
    emit(const OtpState());
  }
}