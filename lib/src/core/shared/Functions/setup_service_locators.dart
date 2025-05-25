import 'package:manazel/src/core/network/dio_service.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:manazel/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../../config/res/constants_manager.dart';
import '../../../features/home/di/home_di.dart';
import '../../../features/login/domain/repository/login_repository.dart';
import '../../../features/login/presentation/cubit/login_cubit.dart';

void setUpServiceLocator() {
  setUpHomeDependencies();
  setUpGeneralDependencies();
  setUpLoginDependencies();
}

void setUpGeneralDependencies() {
  sl.registerLazySingleton<NetworkService>(
    () => DioService(),
  );

  sl.registerLazySingleton<UserCubit>(
    () => UserCubit(),
  );

  sl.registerFactory<NotificationService>(
    () => NotificationService(),
  );
}

void setUpLoginDependencies() {
  // Data layer
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl()));

  // Domain layer
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Presentation layer
  sl.registerFactory(() => LoginCubit(sl()));
}
