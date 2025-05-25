import 'package:manazel/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<User> login(LoginUseCaseParams loginUseCaseParams) {
    return loginRemoteDataSource.login(loginUseCaseParams);
  }
}
