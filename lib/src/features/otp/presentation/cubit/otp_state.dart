part of 'otp_cubit.dart';
class OtpState extends Equatable {
  final String verificationCode;
  final RequestState verificationState;
  final String verificationError;

  const OtpState({
    this.verificationCode = '',
    this.verificationState = RequestState.initial,
    this.verificationError = '',
  });

  OtpState copyWith({
    String? verificationCode,
    RequestState? verificationState,
    String? verificationError,
  }) {
    return OtpState(
      verificationCode: verificationCode ?? this.verificationCode,
      verificationState: verificationState ?? this.verificationState,
      verificationError: verificationError ?? this.verificationError,
    );
  }

  @override
  List<Object?> get props => [
    verificationCode,
    verificationState,
    verificationError,
  ];
}