class BaseModel<D> {
  final bool? success;
  final String? msg;
  final dynamic error;
  final Pagination? pagination;
  final dynamic extras;
  final D? data;

  BaseModel({
    this.success,
    this.msg,
    this.error,
    this.pagination,
    this.extras,
    this.data,
  });

  factory BaseModel.fromMap(
    Map<String, dynamic> map, {
    D Function(dynamic)? mapper,
  }) {
    D? parsed;

    if (mapper != null && map['data'] != null) {
      final raw = map['data'];
      parsed = mapper(raw);
    }

    return BaseModel<D>(
      success: map['success'] == true,
      msg: (map['message'] ?? '').toString(),
      error: map['error'],
      pagination: (map['pagination'] is Map<String, dynamic>)
          ? Pagination.fromJson(map['pagination'])
          : null, // ignore if it's a list or null
      extras: map['extras'],
      data: parsed,
    );
  }

  // handles list of items
  static BaseModel<List<T>> fromList<T>(
    Map<String, dynamic> map, {
    required T Function(dynamic) itemMapper,
  }) {
    return BaseModel<List<T>>.fromMap(
      map,
      mapper: (raw) {
        if (raw is List) {
          return raw.map<T>(itemMapper).toList();
        } else if (raw is Map) {
          return [itemMapper(raw)];
        }
        return <T>[];
      },
    );
  }
}

class Pagination {
  final int totalItems;
  final int perPage;
  final int lastPage;
  final int currentPage;

  Pagination({
    required this.totalItems,
    required this.perPage,
    required this.lastPage,
    required this.currentPage,
  });

  Pagination copyWith({
    int? totalItems,
    int? lastPage,
    int? perPage,
    int? currentPage,
  }) =>
      Pagination(
        totalItems: totalItems ?? this.totalItems,
        perPage: perPage ?? this.perPage,
        lastPage: lastPage ?? this.lastPage,
        currentPage: currentPage ?? this.currentPage,
      );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalItems: json["total"] ?? 0,
        lastPage: json["last_page"] ?? 0,
        perPage: json["per_page"] ?? 0,
        currentPage: json["current_page"] ?? 0,
      );
}
