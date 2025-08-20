import 'package:multiple_result/multiple_result.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/use_case/verify_otp_params.dart';

abstract class VerifyOtpRepository {
  Future<Result<BaseModel<User>, Failure>> call(VerifyOtpParams params);
}
