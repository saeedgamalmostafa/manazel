import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/core/network/backend_configuation.dart';
import 'package:manazel/src/core/network/extensions.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';

import '../../config/language/locale_keys.g.dart';
import '../error/exceptions.dart';
import 'configuration_interceptor.dart';
import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

@LazySingleton(as: NetworkService)
class DioService implements NetworkService {
  late final Dio _dio;

  DioService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.recieveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json;

    if (BackendConfiguation.type.isPhp) {
      _dio.interceptors.add(ConfigurationInterceptor());
    }
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  @override
  void setToken(String token) {
    _dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  @override
  void removeToken() {
    _dio.options.headers.remove(HttpHeaders.authorizationHeader);
  }

  @override
  Future<BaseModel<Model>> callApi<Model>(
    NetworkRequest networkRequest, {
    Model Function(dynamic json)? mapper,
  }) async {
    try {
      await networkRequest.prepareRequestData();

      final response = await _dio.request(
        networkRequest.path,
        data: networkRequest.hasBodyAndProgress()
            ? networkRequest.isFormData
                ? FormData.fromMap(networkRequest.body!)
                : networkRequest.body
            : networkRequest.body,
        queryParameters: networkRequest.queryParameters,
        onSendProgress: networkRequest.hasBodyAndProgress()
            ? networkRequest.onSendProgress
            : null,
        onReceiveProgress: networkRequest.hasBodyAndProgress()
            ? networkRequest.onReceiveProgress
            : null,
        options: Options(
          method: networkRequest.asString(),
          headers: networkRequest.headers,
        ),
      );

      if (mapper != null) {
        return BaseModel.fromMap(response.data, mapper: mapper);
      } else {
        return BaseModel.fromMap(response.data);
      }
    } on DioException catch (e) {
      _handleError(e); // always throws
      rethrow; // in case _handleError doesn’t
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NoInternetConnectionException(LocaleKeys.checkInternet);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case HttpStatus.badRequest:
            if (error is BadRequestException) {
              return NeedActiveFailure(
                error.message!,
              );
            }
            throw BadRequestException(
              error.response?.data['message'] ?? LocaleKeys.badRequest,
              error.response!.statusCode!,
            );
          case HttpStatus.unauthorized:
            throw UnauthorizedException(
              error.response?.data['message'] ?? LocaleKeys.unauthorized,
              error.response!.statusCode!,
            );
          case HttpStatus.locked:
            throw BlockedException(
              error.response?.data['message'] ?? LocaleKeys.unauthorized,
              error.response!.statusCode!,
            );
          case HttpStatus.notFound:
            throw NotFoundException(
              LocaleKeys.notFound,
              error.response!.statusCode!,
            );
          case HttpStatus.conflict:
            throw ConflictException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
              error.response!.statusCode!,
            );
          case HttpStatus.internalServerError:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
              error.response!.statusCode!,
            );
          case HttpStatus.unprocessableEntity:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? LocaleKeys.serverError,
              error.response!.statusCode!,
            );
          default:
            throw ServerException(
              LocaleKeys.serverError,
              error.response!.statusCode!,
            );
        }
      case DioExceptionType.cancel:
        throw ServerException(
          LocaleKeys.intenetWeakness,
          error.response!.statusCode!,
        );
      case DioExceptionType.unknown:
        throw ServerException(
          error.response?.data['message'] ?? LocaleKeys.exceptionError,
          error.response!.statusCode!,
        );
      default:
        throw ServerException(
          error.response?.data['message'] ?? LocaleKeys.exceptionError,
          error.response!.statusCode!,
        );
    }
  }
}
