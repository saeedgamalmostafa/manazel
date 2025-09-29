part of '../../change_phone_imports.dart';

class ChangePhoneBottomSheet extends StatefulWidget {
  const ChangePhoneBottomSheet({super.key});

  @override
  State<ChangePhoneBottomSheet> createState() => _ChangePasswordBottomSheet();
}

class _ChangePasswordBottomSheet extends State<ChangePhoneBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Go.pop();
      Go.push(const AppLayoutScreen(currentIndex: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.sH21),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppAssets.lottie.done.lottie(),
            SizedBox(height: AppSizes.sH16),
            CustomText.titleLarge(
              Languages.currentLanguage.locale == const Locale("ar")
                  ? "تم تغيير رقم جوالك بنجاح\u{1F44B}"
                  : "Your mobile number has been changed successfully\u{1F44B}",
              textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.Text),
            ),
            SizedBox(
              height: AppSizes.sH6,
            ),
            CustomText.titleMedium(
              LocaleKeys.convertHomePage.tr(),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.SubText),
            ),
          ],
        ),
      ),
    );
  }
}
