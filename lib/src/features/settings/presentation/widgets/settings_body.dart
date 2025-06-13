part of '../../settings_imports.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SettingsItem(
            imagePath: AppAssets.svg.userEdit01.path,
            title: LocaleKeys.edit_profile.tr(),
            onTap: () {},
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          SettingsItem(
            imagePath: AppAssets.svg.smartPhone03.path,
            title: LocaleKeys.change_phone_number.tr(),
            onTap: () {},
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          NotificationSettingItem(
            imagePath: AppAssets.svg.elements2.path,
            title: LocaleKeys.notification.tr(),
            TextColor: AppColors.Text,
          ),
          LanguageSettingItem(
            imagePath: AppAssets.svg.elements3.path,
            title: LocaleKeys.selectLanguage.tr(),
            onTap: () {},
            TextColor: AppColors.Text,
            language: '',
          ),
          SettingsItem(
            imagePath: AppAssets.svg.elements5.path,
            title: LocaleKeys.delete_account.tr(),
            onTap: () {},
            TextColor: AppColors.error,
            Arrowcolor: AppColors.error,
          ),
        ],
      ),
    );
  }
}
