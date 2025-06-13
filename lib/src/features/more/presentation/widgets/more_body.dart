part of '../../more_imports.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          MoreItem(
            imagePath: AppAssets.svg.user.path,
            title: LocaleKeys.profile.tr(),
            onTap: () {
              Go.push(const ProfileScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.calendar01.path,
            title: LocaleKeys.my_orders.tr(),
            onTap: () {},
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.settings01.path,
            title: LocaleKeys.settings.tr(),
            onTap: () {
              Go.push(const SettingsScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.customerSupport.path,
            title: LocaleKeys.contact_us.tr(),
            onTap: () {
              Go.push(const ContactUsScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.alertDiamond.path,
            title: LocaleKeys.about_us.tr(),
            onTap: () {
              Go.push(AboutUsScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.bookmarkCheck01.path,
            title: LocaleKeys.privacy_policy.tr(),
            onTap: () {
              Go.push(PrivacyPolicyScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.file01.path,
            title: LocaleKeys.terms.tr(),
            onTap: () {
              Go.push(TermsScreen());
            },
            TextColor: AppColors.Text,
            Arrowcolor: AppColors.primary,
          ),
          MoreItem(
            imagePath: AppAssets.svg.elements1.path,
            title: LocaleKeys.log_out.tr(),
            onTap: () {
              LogoutBottomSheet.show(context);
            },
            TextColor: AppColors.error,
            Arrowcolor: AppColors.error,
          ),
        ],
      ),
    );
  }
}
