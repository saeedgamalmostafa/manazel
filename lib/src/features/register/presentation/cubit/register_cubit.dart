import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class RegisterCubit extends AsyncCubit<BaseModel?> {
  RegisterCubit() : super(null);

  Future<void> login() async {
    // if (!formKey.currentState!.validate()) return;
    setLoading();

    final result = await baseCrudUseCase<BaseModel>(
      CrudBaseParams(
        api: ApiConstants.signUp,
        httpRequestType: HttpRequestType.post,
        body: {
          'mobile': '+201107179230',
          'cloud_messaging_token': ConstantManager.token,
          'type': 'client',
          'name': 'abdo',
          'email': 'abdo6@gmail.com'
        },
        mapper: (value) => BaseModel.fromMap(
          value,
        ),
      ),
    );
    result.when(
      (response) {
        // Go.push(const OtpScreen(),
        //     transitionType: TransitionType.slideFromRight);
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );
  }
}
