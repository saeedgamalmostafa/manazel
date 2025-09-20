import 'dart:async';

import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/features/search/model/filter_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class FilterDataCubit extends AsyncCubit<FilterResponse?> {
  FilterDataCubit() : super(null);

  Future<void> getFilterData() async {
    setLoading();

    final result = await baseCrudUseCase<FilterResponse>(CrudBaseParams(
        api: ApiConstants.filter,
        httpRequestType: HttpRequestType.get,
        mapper: (json) => FilterResponse.fromJson(json)));

    result.when(
      (response) {
        setSuccess(data: response.data);
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );
  }
}
