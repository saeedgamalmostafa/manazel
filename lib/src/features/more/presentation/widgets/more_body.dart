part of '../../more_imports.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.sH16, horizontal: AppSizes.sW16),
      child: Column(
        spacing: AppSizes.sH16,
        children: [
          MoreItem(
            imagePath: AppAssets.svg.user.path,
            title: LocaleKeys.profile.tr(),
            onTap: () {
              Go.push(const ProfileScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.calendar01.path,
            title: LocaleKeys.my_orders.tr(),
            onTap: () {},
          ),
          MoreItem(
            imagePath: AppAssets.svg.settings01.path,
            title: LocaleKeys.settings.tr(),
            onTap: () {
              Go.push(const SettingsScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.customerSupport.path,
            title: LocaleKeys.contact_us.tr(),
            onTap: () {
              Go.push(const ContactUsScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.alertDiamond.path,
            title: LocaleKeys.about_us.tr(),
            onTap: () {
              Go.push(AboutUsScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.bookmarkCheck01.path,
            title: LocaleKeys.privacy_policy.tr(),
            onTap: () {
              Go.push(PrivacyPolicyScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.file01.path,
            title: LocaleKeys.terms.tr(),
            onTap: () {
              Go.push(TermsScreen());
            },
          ),
          MoreItem(
            imagePath: AppAssets.svg.elements1.path,
            title: LocaleKeys.log_out.tr(),
            onTap: () {
              LogoutBottomSheet.show(context);
            },
            isLogout: true,
          ),
        ],
      ),
    );
  }
}
