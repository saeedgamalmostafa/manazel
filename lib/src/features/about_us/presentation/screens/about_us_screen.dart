part of '../../about_us_imports.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.aboutUs,
          showBackArrow: true,
        ),
        body: AboutUsBody());
  }
}
