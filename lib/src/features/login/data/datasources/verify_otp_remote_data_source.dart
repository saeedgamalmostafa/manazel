import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_request.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/base_model.dart';
import 'package:manazel/src/features/login/domain/entitiy/user.dart';
import 'package:manazel/src/features/login/domain/use_case/verify_otp_params.dart';

import '../../../../config/res/constants_manager.dart';

abstract class VerifyOtpRemoteDataSource {
  Future<BaseModel<User>> verifyOtp(VerifyOtpParams params);
}

class VerifyOtpRemoteDataSourceImpl implements VerifyOtpRemoteDataSource {
  @override
  Future<BaseModel<User>> verifyOtp(VerifyOtpParams params) async {
    final NetworkRequest networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.verifyOtp,
      body: params.toJson(),
    );

    final response = await sl<NetworkService>().callApi<Map<String, dynamic>>(
      networkRequest,
      mapper: (json) => json as Map<String, dynamic>,
    );

    if (response.data['data'] != null && response.data['data'] is List && (response.data['data'] as List).isNotEmpty) {
      final userData = response.data['data'][0];
      return BaseModel<User>(
        message: response.data['message']?.toString() ?? 'Verification successful',
        data: User(
          name: userData['name']?.toString() ?? '',
          email: userData['email']?.toString() ?? '',
          mobile: userData['mobile']?.toString() ?? '',
          id: int.tryParse(userData['id']?.toString() ?? '0') ?? 0,
          accessToken: userData['access_token']?.toString() ?? '',
          isActive: userData['is_active'] == true,
        ),
      );
    }

    return BaseModel<User>(
      message: response.data['message']?.toString() ?? 'Verification failed',
      data: User(
        name: '',
        email: '',
        mobile: '',
        id: 0,
        accessToken: '',
        isActive: false,
      ),
    );
  }
}
