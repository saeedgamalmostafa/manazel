import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/dio_service.dart';
import 'package:manazel/src/core/network/network_request.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../../../config/res/constants_manager.dart';
import '../../domain/entitiy/user.dart';

abstract class LoginRemoteDataSource {
  Future<BaseModel<User>> login(LoginUseCaseParams loginUseCaseParams);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<BaseModel<User>> login(LoginUseCaseParams loginUseCaseParams) async {
    final NetworkRequest networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.login,
      body: {
        "phone": loginUseCaseParams.phone,
        "type": loginUseCaseParams.type,
        "fcm_token": loginUseCaseParams.fcmToken,
      },
    );
    await sl<NetworkService>().callApi(
      networkRequest,
    );
    return await sl<NetworkService>().callApi(
      networkRequest,
    );
  }
}
