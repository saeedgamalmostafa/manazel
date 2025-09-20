import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';

class FilterCubit extends AsyncCubit<BaseModel<List<PropertyItem>>?> {
  FilterParams? filterParams;
  FilterCubit() : super(null);

  int currentPage = 1;
  bool hasMore = true;
  bool isProcessingRequest = false;

  Future<void> getPropertyByFilter(
      {bool isFirst = false, FilterParams? newParams}) async {
    if (isProcessingRequest) return;
    isProcessingRequest = true;

    filterParams = newParams ?? filterParams;
    if (isFirst) {
      currentPage = 1;
      hasMore = true;
      setSuccess(
          data: BaseModel<List<PropertyItem>>(
        data: [],
        pagination: null,
        msg: '',
      ));
    }

    if (!hasMore) {
      isProcessingRequest = false;
      return;
    }

    if (currentPage == 1) {
      setLoading();
    } else {
      setLoadingMore();
    }

    if (!hasMore) return;
    if (currentPage == 1) {
      setLoading();
    } else {
      setLoadingMore();
    }

    final result = await baseCrudUseCase<BaseModel<List<PropertyItem>>>(
      CrudBaseParams(
        api: ApiConstants.property,
        queryParameters: {
          'page': currentPage,
          ...?filterParams?.toJson(),
        },
        httpRequestType: HttpRequestType.get,
        mapper: (json) {
          return BaseModel<List<PropertyItem>>(
            msg: json['msg'] ?? '',
            success: json['success'] ?? true,
            data: (json['properties'] as List)
                .map((e) => PropertyItem.fromJson(e))
                .toList(),
          );
        },
      ),
    );

    result.when(
      (response) {
        if (response.pagination!.lastPage > currentPage) {
          currentPage++;
        } else {
          hasMore = false;
        }

        if (state.data!.data != null) {
          setSuccess(
            data: BaseModel(
              msg: response.msg,
              data: [...state.data!.data!, ...?response.data!.data],
              pagination: response.pagination,
            ),
          );
        }
      },
      (error) {
        setError(errorMessage: error.message, showToast: true);
      },
    );

    isProcessingRequest = false;
  }
}

class FilterParams {
  String? search;
  String? type;
  String? purpose;
  String? active;
  String? cityId;
  String? priceMin;
  String? priceMax;

  FilterParams({
    this.search,
    this.type,
    this.purpose,
    this.active,
    this.cityId,
    this.priceMin,
    this.priceMax,
  });

  Map<String, dynamic> toJson() {
    return {
      'search': search,
      'type': type,
      'purpose': purpose,
      'active': active,
      'city_id': cityId,
      'price_min': priceMin,
      'price_max': priceMax,
    }..removeWhere((key, value) => value == null);
  }
}
