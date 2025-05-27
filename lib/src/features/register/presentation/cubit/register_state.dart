part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String phone;
  final String name;
  final String email;
  final RequestState requestState;
  final String error;
  final RegisterUser? user;

  RegisterState({
    this.phone = '',
    this.requestState = RequestState.initial,
    this.error = '',
    this.user,
    this.name = '',
    this.email = '',
  });

  RegisterState copyWith({
    String? phone,
    String? name,
    String? email,
    RequestState? requestState,
    String? error,
    final RegisterUser? user,
  }) {
    return RegisterState(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      requestState: requestState ?? this.requestState,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        name,
        email,
        requestState,
        error,
        user,
      ];
}
