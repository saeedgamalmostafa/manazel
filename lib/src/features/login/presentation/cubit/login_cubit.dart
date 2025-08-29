import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manazel/src/core/helpers/request_state.dart';

import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginState());

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  Future<void> login() async {
    if (state.phone.isEmpty) {
      emit(state.copyWith(
        requestState: RequestState.error,
        error: 'Phone number cannot be empty',
      ));
      return;
    }

    try {
      emit(state.copyWith(
        requestState: RequestState.loading,
        error: '',
      ));

      final result = await _loginUseCase(LoginUseCaseParams(
        phone: state.phone,
        type: 'client',
        fcmToken: 'fcmToken',
      ));

      emit(state.copyWith(
        requestState: RequestState.success,
        isVerificationCodeSent: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        requestState: RequestState.error,
        error: e.toString(),
      ));
    }
  }

  void resetLogin() {
    emit(const LoginState());
  }
}
//
// class LoginCubit extends Cubit<LoginState> {
//   final LoginUseCase _loginUseCase;
//   final VerifyOtpUseCase _verifyOtpUseCase;
//   final UserCubit _userCubit;
//   StreamSubscription? _userSubscription;
//
//   LoginCubit({
//     required LoginUseCase loginUseCase,
//     required VerifyOtpUseCase verifyOtpUseCase,
//     required UserCubit userCubit,
//   })  : _loginUseCase = loginUseCase,
//         _verifyOtpUseCase = verifyOtpUseCase,
//         _userCubit = userCubit,
//         super(const LoginState()) {
//     // Listen to user state changes
//     _userSubscription = _userCubit.stream.listen((userState) {
//       if (userState.userStatus == UserStatus.loggedIn) {
//         emit(state.copyWith(
//           verificationState: RequestState.success,
//           isVerificationCodeSent: false,
//         ));
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     _userSubscription?.cancel();
//     return super.close();
//   }
//
//   void onPhoneChanged(String phone) {
//     emit(state.copyWith(phone: phone));
//   }
//
//   void onVerificationCodeChanged(String code) {
//     emit(state.copyWith(verificationCode: code));
//   }
//
//   Future<void> login() async {
//     if (state.phone.isEmpty) {
//       emit(state.copyWith(
//         requestState: RequestState.error,
//         error: 'Phone number cannot be empty',
//       ));
//       return;
//     }
//
//     try {
//       emit(state.copyWith(
//         requestState: RequestState.loading,
//         error: '',
//         verificationError: '',
//       ));
//
//       final result = await _loginUseCase(LoginUseCaseParams(
//         phone: state.phone,
//         type: 'client',
//         fcmToken: 'fcmToken', // TODO: Get actual FCM token
//       ));
//
//       emit(state.copyWith(
//         requestState: RequestState.success,
//         isVerificationCodeSent: true,
//         verificationState: RequestState.initial,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         requestState: RequestState.error,
//         error: e.toString(),
//         isVerificationCodeSent: false,
//       ));
//     }
//   }
//
//   Future<void> verifyOtp() async {
//     if (state.verificationCode.isEmpty || state.verificationCode.length != 6) {
//       emit(state.copyWith(
//         verificationState: RequestState.error,
//         verificationError: 'Please enter a valid 6-digit code',
//       ));
//       return;
//     }
//
//     try {
//       emit(state.copyWith(
//         verificationState: RequestState.loading,
//         verificationError: '',
//       ));
//
//       final result = await _verifyOtpUseCase(VerifyOtpParams(
//         code: state.verificationCode,
//       ));
//
//       result.when(
//         (userResponse) {
//           if (userResponse.data.accessToken.isNotEmpty) {
//             _userCubit.setUserLoggedIn(
//               user: UserModel(
//                 id: userResponse.data.id,
//                 name: userResponse.data.name,
//                 mobile: userResponse.data.mobile,
//                 accessToken: userResponse.data.accessToken,
//                 isActive: userResponse.data.isActive,
//               ),
//               token: userResponse.data.accessToken,
//             );
//           } else {
//             emit(state.copyWith(
//               verificationState: RequestState.error,
//               verificationError: 'Verification failed. Please try again.',
//             ));
//           }
//         },
//         (failure) {
//           emit(state.copyWith(
//             verificationState: RequestState.error,
//             verificationError: failure.message,
//           ));
//         },
//       );
//     } catch (e) {
//       emit(state.copyWith(
//         verificationState: RequestState.error,
//         verificationError: 'An error occurred. Please try again.',
//       ));
//     }
//   }
//
//   void resetVerification() {
//     emit(state.copyWith(
//       verificationCode: '',
//       isVerificationCodeSent: false,
//       verificationState: RequestState.initial,
//       verificationError: '',
//     ));
//   }
// }
