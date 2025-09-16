part of '../../settings_imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.settings.tr(),
          showBackArrow: true,
        ),
        body: BlocProvider(
          create: (context) => SettingsCubit(),
          child: const SettingsBody(),
        ));
  }
}
