import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

abstract class LoginRepository {
  Future<User> login(LoginUseCaseParams loginUseCaseParams);
}
