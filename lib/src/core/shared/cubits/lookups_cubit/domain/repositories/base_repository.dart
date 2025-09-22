part of '../base_domain_imports.dart';

abstract class BaseRepository {
  Future<Result<List<T>, Failure>> getBaseIdAndNameEntity<T extends BaseEntity>(
      GetBaseEntityParams? param);

  // Change T to BaseModel<T>
  Future<Result<BaseModel<T>, Failure>> crudCall<T>(CrudBaseParams params);
}