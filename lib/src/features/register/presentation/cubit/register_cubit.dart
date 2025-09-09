import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:manazel/src/features/otp/otp_imports.dart';

class RegisterCubit extends AsyncCubit<BaseModel?> with RegisterControllers {
  RegisterCubit() : super(null);

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    setLoading();
    injector<NetworkService>().removeToken();
    final result = await baseCrudUseCase<UserAuthModel>(
      CrudBaseParams(
        api: ApiConstants.signUp,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+966${phoneController.text}',
          'cloud_messaging_token': ConstantManager.token,
          'type': 'client',
          'name': nameController.text,
          'email': emailController.text
        },
        mapper: (p0) => UserAuthModel.fromJson(p0),
      ),
    );
    result.when(
      (response) {
        final token = response.data?.isNotEmpty == true
            ? response.data!.first.accessToken
            : null;

        if (token != null) {
          injector<NetworkService>().setToken(token);
        }

        Go.push(
            OtpScreen(
              phone: '+966${phoneController.text}',
            ),
            transitionType: TransitionType.slideFromRight);
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
