part of '../imports/presentaion_imports.dart';

class HomeCubit extends AsyncCubit<HomeModel?> {
  HomeCubit() : super(null) {
    fetchHome();
  }

  void fetchHome() async {
    setLoading();
    final result = await baseCrudUseCase<HomeModel>(
      CrudBaseParams(
        api: ApiConstants.home,
        httpRequestType: HttpRequestType.get,
        mapper: (value) => HomeModel.fromJson(value),
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

class HomeModel {
  final int notifications;
  final List<Advertisement> advertisements;
  final Properties properties;

  HomeModel({
    required this.notifications,
    required this.advertisements,
    required this.properties,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      notifications: json['notifications'] ?? 0,
      advertisements: (json['advertisements'] as List<dynamic>)
          .map((e) => Advertisement.fromJson(e))
          .toList(),
      properties: Properties.fromJson(json['properties']),
    );
  }
}

class Advertisement {
  final int id;
  final String title;
  final String image;

  Advertisement({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class Properties {
  final List<PropertyItem> rent;
  final List<PropertyItem> buy;

  Properties({
    required this.rent,
    required this.buy,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      rent: (json['rent'] as List<dynamic>)
          .map((e) => PropertyItem.fromJson(e))
          .toList(),
      buy: (json['buy'] as List<dynamic>)
          .map((e) => PropertyItem.fromJson(e))
          .toList(),
    );
  }
}

class PropertyItem {
  final int id;
  final String title;
  final String address;
  final String rate;
  final String price;
  final List<String>? images;
  final ValueNotifier<bool> isFavourite;

  PropertyItem({
    required this.id,
    required this.title,
    required this.address,
    required this.rate,
    required this.price,
    required this.images,
    required this.isFavourite,
  });

  factory PropertyItem.fromJson(Map<String, dynamic> json) {
    return PropertyItem(
      id: json['id'],
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      rate: json['rate'] ?? '',
      price: json['price'] ?? '',
      images:
          (json['images'] as List<dynamic>).map((e) => e.toString()).toList(),
      isFavourite: ValueNotifier(json["is_favourite"] ?? false),
    );
  }
}
