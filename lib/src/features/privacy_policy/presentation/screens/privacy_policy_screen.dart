part of '../../privacy_policy_imports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.privacyPolicy.tr(),
          showBackArrow: true,
        ),
        body: PrivacyPolicyBody());
  }
}
