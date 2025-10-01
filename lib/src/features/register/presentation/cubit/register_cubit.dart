import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';
import 'package:manazel/src/features/otp/presentation/cubit/otp_cubit.dart';

class RegisterCubit extends AsyncCubit<BaseModel?> with RegisterControllers {
  RegisterCubit() : super(null);

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    setLoading();
    injector<NetworkService>().removeToken();
    final result = await baseCrudUseCase<UserAuthModel>(CrudBaseParams(
        api: ApiConstants.signUp,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+966${phoneController.text}',
          'cloud_messaging_token': NotificationService.deviceToken,
          'type': 'client',
          'name': nameController.text,
          'email': emailController.text
        }..removeWhere((key, value) => value == null),
        mapper: (json) =>
            UserAuthModel.fromJson(json['user'] as Map<String, dynamic>)));
    result.when(
      (response) {
        final token = response.data?.accessToken;

        if (token != null) {
          injector<NetworkService>().setToken(token);
        }

        Go.push(
            OtpScreen(
              otpType: OtpType.auth,
              phone: '+966${phoneController.text}',
            ),
            transitionType: TransitionType.slideFromRight);
        showSuccessToast('cod is: ${response.data!.verificationCode}',
            duration: 5);
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );
  }
}

mixin RegisterControllers {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
}
