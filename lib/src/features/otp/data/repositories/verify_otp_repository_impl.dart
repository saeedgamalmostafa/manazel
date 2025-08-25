import 'package:multiple_result/multiple_result.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/features/otp/data/datasources/verify_otp_remote_data_source.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/otp/domain/repository/verify_otp_repository.dart';
import 'package:manazel/src/features/otp/domain/user_case/verify_otp_params.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  final VerifyOtpRemoteDataSource remoteDataSource;

  VerifyOtpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<BaseModel<User>, Failure>> call(VerifyOtpParams params) async {
    try {
      final response = await remoteDataSource.verifyOtp(params);
      return Success(response);
    } on Failure catch (failure) {
      return Error(failure);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
