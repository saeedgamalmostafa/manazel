import 'package:flutter/foundation.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';

import '../error/exceptions.dart';

extension ErrorHandler<T extends dynamic> on Future<T> {
  Future<Result<T, Failure>> handleCallbackWithFailure() async {
    if (kDebugMode) {
      return await _defaultHandler();
    } else {
      try {
        return await _defaultHandler();
      } catch (e) {
        return const Error(Failure('An error occurred'));
      }
    }
  }

  Future<Result<T, Failure>> _defaultHandler() async {
    try {
      final result = await this;
      return Success(result);
    } on ServerException catch (e) {
      return Error(Failure(e.message, code: e.statusCode.toString()));
    }
  }
}
