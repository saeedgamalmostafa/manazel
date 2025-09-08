part of '../../edit_profile_imports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.editProfile.tr(),
          showBackArrow: true,
        ),
        body: EditProfileBody(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
              onPressed: () {
                showDefaultBottomSheet(child: EditProfileBottomSheet());
              },
              text: LocaleKeys.sure.tr(),
            )));
  }
}
