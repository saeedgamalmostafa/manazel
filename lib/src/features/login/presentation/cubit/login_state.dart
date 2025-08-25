part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String phone;
  final RequestState requestState;
  final String error;
  final bool isVerificationCodeSent;

  const LoginState({
    this.phone = '',
    this.requestState = RequestState.initial,
    this.error = '',
    this.isVerificationCodeSent = false,
  });

  LoginState copyWith({
    String? phone,
    RequestState? requestState,
    String? error,
    bool? isVerificationCodeSent,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      requestState: requestState ?? this.requestState,
      error: error ?? this.error,
      isVerificationCodeSent:
          isVerificationCodeSent ?? this.isVerificationCodeSent,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        requestState,
        error,
        isVerificationCodeSent,
      ];
}
//
// class LoginState extends Equatable {
//   final String phone;
//   final RequestState requestState;
//   final String error;
//   final User? user;
//   final String verificationCode;
//   final bool isVerificationCodeSent;
//   final RequestState verificationState;
//   final String verificationError;
//
//   const LoginState({
//     this.phone = '',
//     this.requestState = RequestState.initial,
//     this.error = '',
//     this.user,
//     this.verificationCode = '',
//     this.isVerificationCodeSent = false,
//     this.verificationState = RequestState.initial,
//     this.verificationError = '',
//   });
//
//   LoginState copyWith({
//     String? phone,
//     RequestState? requestState,
//     String? error,
//     User? user,
//     String? verificationCode,
//     bool? isVerificationCodeSent,
//     RequestState? verificationState,
//     String? verificationError,
//   }) {
//     return LoginState(
//       phone: phone ?? this.phone,
//       requestState: requestState ?? this.requestState,
//       error: error ?? this.error,
//       user: user ?? this.user,
//       verificationCode: verificationCode ?? this.verificationCode,
//       isVerificationCodeSent: isVerificationCodeSent ?? this.isVerificationCodeSent,
//       verificationState: verificationState ?? this.verificationState,
//       verificationError: verificationError ?? this.verificationError,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         phone,
//         requestState,
//         error,
//         user,
//         verificationCode,
//         isVerificationCodeSent,
//         verificationState,
//         verificationError,
//       ];
// }
