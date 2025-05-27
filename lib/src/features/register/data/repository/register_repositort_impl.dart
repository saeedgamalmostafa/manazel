
import 'package:manazel/src/features/register/data/datasources/register_remote_data_source.dart';
import 'package:manazel/src/features/register/domain/repository/register_repository.dart';

import '../../domain/entitiy/register_user.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterRepositortImpl implements RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositortImpl({required this.registerRemoteDataSource});

  @override
  Future<RegisterUser> register(RegisterUseCaseParams registerUseCaseParams) {
    return registerRemoteDataSource.register(registerUseCaseParams);
  }
}
