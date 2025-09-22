import '../base_domain_imports.dart';

class BaseModel<D> {
  final bool? success;
  final String msg;
  final List<dynamic>? error;
  final List<Pagination>? pagination;
  final List<dynamic>? extras;
  final D? data;

  BaseModel({
    this.success,
    required this.msg,
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
      parsed = mapper(map['data']);
    }
    return BaseModel<D>(
      success: map['success'] == true,
      msg: (map['message'] ?? '').toString(),
      error: (map['error'] as List?) ?? const [],
      pagination: (map['pagination'] as List?)
          ?.map((e) => Pagination.fromJson(e))
          .toList(),
      extras: (map['extras'] as List?) ?? const [],
      data: parsed,
    );
  }

  // Convenience factories
  static BaseModel<T> fromSingle<T>(
      Map<String, dynamic> map, {
        required T Function(dynamic) mapper,
      }) =>
      BaseModel<T>.fromMap(map, mapper: mapper);

  static BaseModel<List<T>> fromList<T>(
      Map<String, dynamic> map, {
        required T Function(dynamic) itemMapper,
      }) =>
      BaseModel<List<T>>.fromMap(
        map,
        mapper: (raw) {
          if (raw is List) return raw.map<T>(itemMapper).toList();
          // backend returned a single object; coerce to list
          return [itemMapper(raw)];
        },
      );

  BaseModel<D> copyWith({
    bool? success,
    String? msg,
    List<dynamic>? error,
    List<Pagination>? pagination,
    List<dynamic>? extras,
    D? data,
  }) {
    return BaseModel<D>(
      success: success ?? this.success,
      msg: msg ?? this.msg,
      error: error ?? this.error,
      pagination: pagination ?? this.pagination,
      extras: extras ?? this.extras,
      data: data ?? this.data,
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
    totalItems: json["total"],
    lastPage: json["last_page"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
  );
}

class BaseKeyMessageModel<T> {
  final String key;
  final String msg;
  BaseKeyMessageModel({required this.key, required this.msg});

  factory BaseKeyMessageModel.fromMap(Map<String, dynamic> map,
      {T Function(dynamic)? mapper}) {
    return BaseKeyMessageModel<T>(
      key: map['key'] as String,
      msg: map['msg'] as String,
    );
  }
}

// class PaginationResponse<T> extends CrudResponse {
//   final Pagination? pagination;

//   final List<T>? data;
//   PaginationResponse({required this.pagination, this.data});

//   factory PaginationResponse.fromJson(Map<String, dynamic> map,
//       {List<T> Function(dynamic)? mapper, String? dataKey}) {
//     return PaginationResponse<T>(
//       pagination: map["pagination"] != null
//           ? Pagination.fromJson(map["pagination"])
//           : null,
//       data: map[dataKey ?? 'data'] != null && mapper != null
//           ? mapper(map[dataKey ?? 'data'])
//           : null,
//     );
//   }

//   PaginationResponse<T> copyWith({
//     Pagination? pagination,
//     List<T>? data,
//   }) {
//     return PaginationResponse<T>(
//       pagination: pagination ?? this.pagination,
//       data: data ?? this.data,
//     );
//   }
// }