import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<User> call(LoginUseCaseParams loginUseCaseParams) async {
    return await loginRepository.login(
      loginUseCaseParams,
    );
  }
}

class LoginUseCaseParams {
  final String phone;
  final String type;
  final String fcmToken;

  LoginUseCaseParams({
    required this.phone,
    required this.type,
    required this.fcmToken,
  });
}
