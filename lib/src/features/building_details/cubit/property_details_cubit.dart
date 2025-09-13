import 'package:flutter/cupertino.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class PropertyDetailsCubit extends AsyncCubit<PropertyModel?> {
  PropertyDetailsCubit() : super(null);
  Future<void> fetchPropertyDetails(int id) async {
    setLoading();
    final result = await baseCrudUseCase<PropertyModel>(
      CrudBaseParams(
        api: '${ApiConstants.property}/$id',
        httpRequestType: HttpRequestType.get,
        mapper: (value) {
          return PropertyModel.fromJson(value['property']);
        },
      ),
    );

    result.when(
      (response) {
        setSuccess(data: response.data);
      },
      (error) {
        setError(errorMessage: error.message);
      },
    );
  }
}

class PropertyModel {
  final int id;
  final String ownerName;
  final String ownerPhone;
  final String type; // "buy" or "rent"
  final String title;
  final String description;
  final String price;
  final String rate;
  final List<String> images;
  final String address;
  final int viewsCount;
  final ValueNotifier<bool> isFavourite;

  PropertyModel({
    required this.id,
    required this.ownerName,
    required this.ownerPhone,
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.rate,
    required this.images,
    required this.address,
    required this.viewsCount,
    required this.isFavourite,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      ownerName: json['owner_name']?.toString() ?? '',
      ownerPhone: json['owner_phone']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: json['price']?.toString() ?? '0',
      rate: json['rate']?.toString() ?? '0',
      images: (json['images'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .where((url) => url.trim().isNotEmpty) // ✅ skip empty
          .toList(),
      address: json['address']?.toString() ?? '',
      viewsCount: json['views_count'] is int
          ? json['views_count']
          : int.tryParse(json['views_count']?.toString() ?? '0') ?? 0,
      isFavourite: ValueNotifier(json["is_favourite"] ?? false),
    );
  }
}
