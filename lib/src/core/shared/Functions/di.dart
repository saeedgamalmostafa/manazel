import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:manazel/src/core/shared/Functions/di.config.dart';

import '../../../config/res/constants_manager.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void setUpInjector() async {
  injector.registerLazySingleton(() => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true)));

  // sl.registerFactory<NotificationService>(
  //   () => NotificationService(),
  // );
}

void configureDependencies() {
  injector.init();
  setUpInjector();
}

Future<void> resetDependenciesScope() async {
  await injector.resetScope();
  configureDependencies();
}
