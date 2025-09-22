import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';
import '../../../config/res/constants_manager.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;
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