import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/features/login/login_imports.dart';

class ServerException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const ServerException(this.message, this.statusCode);

  @override
  String toString() => "ServerException: $message, statusCode: $statusCode";

  @override
  List<Object?> get props => [message, statusCode];
}

class FetchDataException extends ServerException {
  const FetchDataException(super.message, super.statusCode);
}

class BadRequestException extends ServerException {
  const BadRequestException(super.message, super.statusCode);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.message, super.statusCode) {
    Go.pushAndRemoveUntil(
        transitionType: TransitionType.fade, const LoginScreen());
  }
}

class NotFoundException extends ServerException {
  const NotFoundException(super.message, super.statusCode);
}

class ConflictException extends ServerException {
  const ConflictException(super.message, super.statusCode);
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message, statusCode])
      : super(message ?? LocaleKeys.checkInternet, statusCode);
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message, statusCode])
      : super(message ?? LocaleKeys.checkInternet.tr(), statusCode);
}

class CacheException implements Exception {}

class ForbiddenException extends ServerException {
  const ForbiddenException(super.message, super.statusCode);
}

class BlockedException extends ServerException {
  const BlockedException(super.message, super.statusCode);
}
