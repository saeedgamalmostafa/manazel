import 'package:manazel/src/core/network/dio_service.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/features/login/data/datasources/login_remote_data_source.dart';
import 'package:manazel/src/features/login/data/datasources/verify_otp_remote_data_source.dart';
import 'package:manazel/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:manazel/src/features/login/domain/use_case/login_usecase.dart';

import '../../../config/res/constants_manager.dart';
import '../../../features/app_layout/presentation/cubit/app_layout_cubit.dart';
import '../../../features/home/di/home_di.dart';
import '../../../features/login/data/repositories/verify_otp_repository_impl.dart';
import '../../../features/login/domain/repository/login_repository.dart';
import '../../../features/login/domain/repository/verify_otp_repository.dart';
import '../../../features/login/domain/use_case/verify_otp_usecase.dart';
import '../../../features/login/presentation/cubit/login_cubit.dart';

void setUpServiceLocator() {
  setUpHomeDependencies();
  setUpGeneralDependencies();
  setUpLoginDependencies();
  setUpAppLayoutDependencies();
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

  sl.registerLazySingleton<VerifyOtpRemoteDataSource>(
      () => VerifyOtpRemoteDataSourceImpl());

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl()));
  sl.registerLazySingleton<VerifyOtpRepository>(
      () => VerifyOtpRepositoryImpl(remoteDataSource: sl()));

  // Domain layer
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));


  // Presentation layer
  sl.registerFactory(() => LoginCubit(userCubit: sl(), loginUseCase: sl<LoginUseCase>(), verifyOtpUseCase: sl()));
}
/* <<<<<<<<<<<<<<  ✨ Windsurf Command ⭐ >>>>>>>>>>>>>>>> */
/// Registers the dependencies required by [AppLayoutCubit].
///
/// This includes no dependencies, since [AppLayoutCubit] has no dependencies.
///
/* <<<<<<<<<<  cbae0353-2fa9-4de1-bca8-ef6d3c822b89  >>>>>>>>>>> */
void setUpAppLayoutDependencies() {
  sl.registerFactory<AppLayoutCubit>(() => AppLayoutCubit());
}
