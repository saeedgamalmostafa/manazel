import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';

class FavCubit extends AsyncCubit<BaseModel<List<FavouriteModel>>?> {
  FavCubit() : super(null);

  bool isFavLoading = false;

  int currentPage = 1;
  bool hasMore = true;
  bool isProcessingRequest = false;

  Future<void> toggleFav(String id) async {
    isFavLoading = true;
    final result = await baseCrudUseCase(
      CrudBaseParams(
        api: ApiConstants.toggleFav,
        body: {'property_id': id},
        httpRequestType: HttpRequestType.post,
        mapper: (value) => {},
      ),
    );

    result.when(
      (response) async {
        isFavLoading = false;
        await deleteFav(id);
        showSuccessToast(response.msg);
      },
      (error) {
        setError(errorMessage: error.message);
        showErrorToast(error.message);
      },
    );
  }

  Future<void> getFavourites({bool isFirst = false}) async {
    if (isProcessingRequest) return;
    isProcessingRequest = true;

    if (isFirst) {
      currentPage = 1;
      hasMore = true;
      setSuccess(
          data: BaseModel<List<FavouriteModel>>(
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

    final result = await baseCrudUseCase<BaseModel<List<FavouriteModel>>>(
      CrudBaseParams(
        api: ApiConstants.getFav,
        queryParameters: {'page': currentPage},
        httpRequestType: HttpRequestType.get,
        mapper: (json) {
          return BaseModel<List<FavouriteModel>>(
            msg: json['msg'] ?? '',
            success: json['success'] ?? true,
            data: (json['favourites'] as List)
                .map((e) => FavouriteModel.fromJson(e))
                .toList(),
          );
        },
      ),
    );

    result.when(
      (response) {
        if (response.pagination!.first.lastPage > currentPage) {
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
        } else {
          // setSuccess(data: response.data);
        }
      },
      (error) {
        setError(errorMessage: error.message);
        showErrorToast(error.message);
      },
    );

    isProcessingRequest = false;
  }

  Future<void> deleteFav(String id) async {
    final current = state.data?.data ?? [];
    final updated = List<FavouriteModel>.from(current)
      ..removeWhere((element) => element.property.id == int.parse(id));

    setSuccess(
      data: BaseModel(
        msg: '',
        data: updated,
        pagination: state.data?.pagination,
      ),
    );
  }
}

class FavouriteModel {
  final int id;
  final PropertyItem property;

  FavouriteModel({
    required this.id,
    required this.property,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      property: PropertyItem.fromJson(json['property']),
    );
  }
}
