import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/login/login_imports.dart';

class SettingsCubit extends AsyncCubit {
  SettingsCubit() : super(null);

  Future<void> deleteAccount() async {
    final result = await baseCrudUseCase(
      CrudBaseParams(
          api: ApiConstants.deleteAccount,
          httpRequestType: HttpRequestType.post,
          mapper: (json) => {}),
    );

    result.when(
      (response) {
        Go.pushAndRemoveUntil(
          const LoginScreen(),
          transitionType: TransitionType.slideFromTop,
        );
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );
  }
}
