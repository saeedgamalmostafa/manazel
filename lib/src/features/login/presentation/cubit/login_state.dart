part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String phone;
  final RequestState requestState;
  final String error;
  final User? user;

  const LoginState({
    this.phone = '',
    this.requestState = RequestState.initial,
    this.error = '',
    this.user,
  });

  LoginState copyWith({
    String? phone,
    RequestState? requestState,
    String? error,
    final User? user,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      requestState: requestState ?? this.requestState,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        requestState,
        user,
      ];
}
