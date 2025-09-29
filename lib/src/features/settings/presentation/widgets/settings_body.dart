part of '../../settings_imports.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    context.locale;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: AppSizes.sH16,
        children: [
          CustomMoreItem(
            imagePath: AppAssets.svg.userEdit01.path,
            title: LocaleKeys.editProfile.tr(),
            onTap: () {
              Go.push(const EditProfileScreen());
            },
          ),
          CustomMoreItem(
            imagePath: AppAssets.svg.smartPhone03.path,
            title: LocaleKeys.changePhone.tr(),
            onTap: () {
              Go.push(
                const ChangePhoneScreen(),
                transitionType: TransitionType.slideFromRight,
              );
            },
          ),
          NotificationSettingItem(
            imagePath: AppAssets.svg.notification.path,
            title: LocaleKeys.notification.tr(),
          ),
          LanguageSettingItem(
            imagePath: AppAssets.svg.elements3.path,
            title: LocaleKeys.language.tr(),
            onTap: () {},
          ),
          CustomMoreItem(
            imagePath: AppAssets.svg.elements5.path,
            title: LocaleKeys.deleteAccount.tr(),
            onTap: () {
              DeleteAccountBottomSheet.show(context, cubit);
            },
            isLogout: true,
          ),
        ],
      ),
    );
  }
}
