part of '../../about_us_imports.dart';

class AboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: LocaleKeys.about_us.tr(),
        showBackArrow: true,
      ),
      body: AboutUsBody()
    );
  }
}
