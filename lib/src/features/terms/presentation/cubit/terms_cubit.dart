import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

enum TermsType { terms, privacy, about }

extension TermsTypeX on TermsType {
  int get id => switch (this) {
        TermsType.privacy => 3,
        TermsType.terms => 2,
        TermsType.about => 1,
      };

  String get title => switch (this) {
        TermsType.terms => LocaleKeys.terms,
        TermsType.privacy => LocaleKeys.privacyPolicy,
        TermsType.about => LocaleKeys.aboutUs,
      };
}

class TermsCubit extends AsyncCubit<String> {
  TermsCubit() : super('');

  Future<void> getData(TermsType type) async {
    setLoading();

    final result = await baseCrudUseCase<String>(
      CrudBaseParams(
        api: ApiConstants.terms,
        queryParameters: {'id': type.id, 'resourcefull': 0},
        httpRequestType: HttpRequestType.post,
        mapper: (json) => json is String ? json : json.toString(),
      ),
    );

    result.when(
      (success) {
        setSuccess(data: success.data ?? ''); // success is a String
      },
      (error) {
        setError();
        showErrorToast(error.message);
      },
    );
  }
}
