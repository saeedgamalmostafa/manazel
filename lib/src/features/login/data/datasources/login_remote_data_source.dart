import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../domain/entitiy/user.dart';

abstract class LoginRemoteDataSource {
  Future<User> login(LoginUseCaseParams loginUseCaseParams);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<User> login(LoginUseCaseParams loginUseCaseParams) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      email: 'email',
      id: 1,
      name: 'name',
      accessToken: 'accessToken',
      isActive: true,
      mobile: '123456789',
    );
  }
}
