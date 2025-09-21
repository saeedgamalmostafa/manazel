part of '../../change_password_imports.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.changePassword.tr(),
          showBackArrow: true,
        ),
        body: const ChangePhoneBody(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
              onPressed: () {
                showDefaultBottomSheet(child: ChangePasswordBottomSheet());
              },
              text: LocaleKeys.sure.tr(),
            )));
  }
}
