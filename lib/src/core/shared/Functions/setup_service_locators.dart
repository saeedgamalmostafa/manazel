import 'package:manazel/src/core/network/dio_service.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/notification/notification_service.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';

import '../../../config/res/constants_manager.dart';
import '../../../features/home/di/home_di.dart';

void setUpServiceLocator() {
  setUpHomeDependencies();
  setUpGeneralDependencies();
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
