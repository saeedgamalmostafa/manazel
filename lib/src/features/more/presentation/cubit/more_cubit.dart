import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/features/login/login_imports.dart';

class MoreCubit extends AsyncCubit {
  MoreCubit() : super(null);
  final UserCubit userCubit = UserCubit.instance;

  Future<void> logOut() async {
    final result = await baseCrudUseCase(
      CrudBaseParams(
          api: ApiConstants.logout,
          httpRequestType: HttpRequestType.post,
          mapper: (json) {}),
    );

    result.when(
      (response) {
        showSuccessToast(response.msg ?? '');
        userCubit.logout();
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
