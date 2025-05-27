
import 'package:manazel/src/features/register/domain/usecases/register_usecase.dart';

import '../../domain/entitiy/register_user.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterUser> register(RegisterUseCaseParams registerUseCaseParams);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  @override
  Future<RegisterUser> register(
      RegisterUseCaseParams registerUseCaseParams) async {
    await Future.delayed(const Duration(seconds: 1));
    return RegisterUser(
      email: 'email',
      id: 1,
      name: 'name',
      accessToken: 'accessToken',
      isActive: true,
      mobile: '123456789',
    );
  }
}
