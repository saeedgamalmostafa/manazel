import 'dart:io';

import 'package:dio/dio.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/core/network/backend_configuation.dart';

class ConfigurationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      HttpHeaders.acceptHeader: ContentType.json,
      Headers.contentTypeHeader: Headers.jsonContentType,
      HttpHeaders.acceptLanguageHeader:
          Languages.currentLanguage.locale.languageCode
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (BackendConfiguation.type.isPhp) {
      _handleError(response);
    }
    handler.next(response);
  }

  void _handleError(Response response) {
    final errorMessage = response.data['message'];
    final statusCode = _mapErrorKeyToStatusCode(response.statusCode ?? 400);

    if (statusCode != null) {
      throw DioException(
        type: DioExceptionType.badResponse,
        requestOptions: response.requestOptions,
        response: Response(
          requestOptions: response.requestOptions,
          data: {
            'message': errorMessage,
          },
          statusCode: statusCode,
        ),
        error: {
          'message': errorMessage,
        },
      );
    }
  }

  int? _mapErrorKeyToStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return HttpStatus.badRequest;
      case 401:
        return HttpStatus.unauthorized;
      case 423:
        return HttpStatus.locked;
      case 500:
        return HttpStatus.internalServerError;
      case 403:
        return HttpStatus.forbidden;
      default:
        return null;
    }
  }
}
