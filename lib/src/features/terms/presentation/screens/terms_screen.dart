part of '../../terms_imports.dart';

class TermsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.privacy_policy.tr(),
          showBackArrow: true,
        ),
        body: TermsBody()
    );
  }
}
