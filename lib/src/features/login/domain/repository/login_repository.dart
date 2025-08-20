import 'package:multiple_result/multiple_result.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';
import '../../../../core/shared/base_model.dart';

abstract class LoginRepository {
  Future<Result<BaseModel<User>, Failure>> login(LoginUseCaseParams loginUseCaseParams);
}
