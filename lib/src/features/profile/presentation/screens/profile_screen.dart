part of '../../profile_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.profile.tr(),
          showBackArrow: true,
          onBackPressed: () {},
        ),
        body: const ProfileBody());
  }
}
