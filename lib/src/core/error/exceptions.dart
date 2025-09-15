import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/features/login/login_imports.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [message];
}

class FetchDataException extends ServerException {
  const FetchDataException(super.message);
}

class BadRequestException extends ServerException {
  const BadRequestException(super.message);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.message) {
    showErrorToast('Login first');
    Go.pushAndRemoveUntil(
        transitionType: TransitionType.fade, const LoginScreen());
  }
}

class NotFoundException extends ServerException {
  const NotFoundException(super.message);
}

class ConflictException extends ServerException {
  const ConflictException(super.message);
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message])
      : super(message ?? LocaleKeys.checkInternet);
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super(message ?? LocaleKeys.checkInternet.tr());
}

class CacheException implements Exception {}

class ForbiddenException extends ServerException {
  const ForbiddenException(super.message);
}

class BlockedException extends ServerException {
  const BlockedException(super.message);
}
