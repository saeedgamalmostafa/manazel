part of '../../settings_imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: LocaleKeys.settings.tr(),
        showBackArrow: true,
      ),
      body: SettingsBody()
    );
  }
}
