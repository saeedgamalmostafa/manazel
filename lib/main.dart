import 'package:flutter/foundation.dart';
import 'package:manazel/src/config/language/languages.dart';
import 'package:manazel/src/core/navigation/constants/imports_constants.dart';
import 'package:manazel/src/core/navigation/go.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manazel/src/core/navigation/transition/implementation/fade/Option/fade_animation_option.dart';
import 'package:manazel/src/core/network/backend_configuation.dart';
import 'package:manazel/src/core/shared/Functions/setup_service_locators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';
import 'src/core/navigation/page_router/implementation/imports_page_router.dart';
import 'src/core/navigation/page_router/imports_page_router_builder.dart';
import 'src/core/helpers/cache_service.dart';
import 'src/core/shared/bloc_observer.dart';
import 'src/core/widgets/exeption_view.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(
    [EasyLocalization.ensureInitialized(), CacheStorage.init()],
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  setUpServiceLocator();
  BackendConfiguation.setBackendType(BackendType.php);
  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),
    ),
  );
  if (kReleaseMode) {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => const ExceptionView();
  }
  runApp(
    EasyLocalization(
      supportedLocales: Languages.supportedLocales,
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Languages.arabic.locale,
      fallbackLocale: const Locale('ar'),
      child: const App(),
    ),
  );
}
