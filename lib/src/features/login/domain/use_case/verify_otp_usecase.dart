import 'package:manazel/src/features/login/domain/use_case/verify_otp_params.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/repository/verify_otp_repository.dart';

class VerifyOtpUseCase {
  final VerifyOtpRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Result<BaseModel<User>, Failure>> call(VerifyOtpParams params) async {
    return await repository(params);
  }
}
