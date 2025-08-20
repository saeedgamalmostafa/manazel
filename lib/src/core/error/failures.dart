import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String message, {String? code}) : super(message, code: code);
}

class CacheFailure extends Failure {
  const CacheFailure(String message, {String? code}) : super(message, code: code);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message, {String? code})
      : super(message, code: code);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message, {String? code})
      : super(message, code: code);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message, {String? code})
      : super(message, code: code);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message, {String? code})
      : super(message, code: code);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(String message, {String? code})
      : super(message, code: code);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message, {String? code})
      : super(message, code: code);
}
