import 'package:manazel/src/features/register/domain/entitiy/register_user.dart';
import 'package:manazel/src/features/register/domain/usecases/register_usecase.dart';

abstract class RegisterRepository {
  Future<RegisterUser> register(RegisterUseCaseParams registerUseCaseParams);
}
