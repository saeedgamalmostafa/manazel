part of '../../profile_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: LocaleKeys.profile.tr(),
        showBackArrow: true,
        onBackPressed: () {},
      ),
      body:ProfileBody()
    );
  }
}
