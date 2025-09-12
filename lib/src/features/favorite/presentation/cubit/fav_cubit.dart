import 'dart:math';

import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';

class FavCubit extends AsyncCubit<List<FavouriteModel>> {
  FavCubit() : super([]);

  Future<void> toggleFav(String id) async {
    setLoading();
    final result = await baseCrudUseCase(
      CrudBaseParams(
        api: ApiConstants.toggleFav,
        body: {'property_id': id},
        httpRequestType: HttpRequestType.post,
        mapper: (value) => {},
      ),
    );
    result.when(
      (response) {
        setSuccess(data: state.data);
        showSuccessToast(response.msg);
      },
      (error) {
        setError(errorMessage: error.message);
        showErrorToast(error.message);
      },
    );
  }

  void getFavourites() async {
    setLoading();
    final result = await baseCrudUseCase<List<FavouriteModel>>(
      CrudBaseParams(
        api: ApiConstants.getFav,
        httpRequestType: HttpRequestType.get,
        mapper: (json) => (json['favourites'] as List)
            .map((e) => FavouriteModel.fromJson(e))
            .toList(),
      ),
    );
    result.when(
      (response) {
        setSuccess(data: response.data!);
      },
      (error) {
        setError(errorMessage: error.message);
        showErrorToast(error.message);
      },
    );
  }

  void deleteFav(String id) {
    setSuccess(
        data: state.data
            .where((element) => element.id != int.parse(id))
            .toList());
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
