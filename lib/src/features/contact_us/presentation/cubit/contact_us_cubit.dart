import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class ContactUsCubit extends AsyncCubit {
  ContactUsCubit() : super(null);

  Future<void> sendMessage(String message) async {
    final reslut = await baseCrudUseCase(CrudBaseParams(
        api: ApiConstants.contactUs,
        queryParameters: {'message': message},
        httpRequestType: HttpRequestType.post,
        mapper: (json) {}));

    reslut.when((s) {
      showSuccessToast(s.msg ?? '');
    }, (e) {
      showErrorToast(e.message);
    });
  }
}
