import 'package:multiple_result/multiple_result.dart';
import 'package:manazel/src/core/error/failures.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/repository/login_repository.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Result<BaseModel<User>, Failure>> login(LoginUseCaseParams loginUseCaseParams) async {
    try {
      final response = await loginRemoteDataSource.login(loginUseCaseParams);
      
      // If login is successful and we have an access token, store it
      if (response.data.accessToken.isNotEmpty) {
        final userCubit = UserCubit.instance;
        final userData = response.data;
        
        // Store user data and token
        await userCubit.setUserLoggedIn(
          user: UserModel(
            id: userData.id,
            name: userData.name,
            mobile: userData.mobile,
            accessToken: userData.accessToken,
            isActive: userData.isActive,
          ),
          token: userData.accessToken,
        );
      }
      
      return Success(response);
    } on Failure catch (failure) {
      return Error(failure);
    } catch (e) {
      return Error(ServerFailure('Failed to login: $e'));
    }
  }
}
