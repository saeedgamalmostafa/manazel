import 'package:manazel/src/features/register/domain/entitiy/register_user.dart';

import '../repository/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository registerRepository;

  RegisterUsecase(this.registerRepository);

  Future<RegisterUser> call(RegisterUseCaseParams registerUseCaseParams) async {
    return await registerRepository.register(
      registerUseCaseParams,
    );
  }
}

class RegisterUseCaseParams {
  final String phone;
  final String type;
  final String name;
  final String email;
  final String fcmToken;

  RegisterUseCaseParams({
    required this.phone,
    required this.type,
    required this.name,
    required this.email,
    required this.fcmToken,
  });
}
