// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../network/network_service.dart' as _i632;
import '../cubits/lookups_cubit/data/base_data_imports.dart' as _i1052;
import '../cubits/lookups_cubit/domain/base_domain_imports.dart' as _i961;
import '../cubits/lookups_cubit/presentation/cubit/get_base_name_and_id/get_base_name_and_id_cubit.dart'
    as _i563;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i563.GetBaseEntityCubit<dynamic>>(
        () => _i563.GetBaseEntityCubit());
    gh.lazySingleton<_i1052.BaseRemoteDataSource>(() =>
        _i1052.BaseRemoteDataSourceImpl(
            dioService: gh<_i632.NetworkService>()));
    gh.lazySingleton<_i961.BaseRepository>(() => _i1052.BaseRepositoryImpl(
        baseRemoteDataSource: gh<_i1052.BaseRemoteDataSource>()));
    gh.lazySingleton<_i961.BaseCrudUseCase>(
        () => _i961.BaseCrudUseCase(repository: gh<_i961.BaseRepository>()));
    gh.lazySingleton<_i961.GetBaseEntityUseCase>(() =>
        _i961.GetBaseEntityUseCase(repository: gh<_i961.BaseRepository>()));
    return this;
  }
}
