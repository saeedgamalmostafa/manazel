part of '../../change_password_imports.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheet();
}

class _ChangePasswordBottomSheet extends State<ChangePasswordBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Go.pop();
      Go.push(AppLayoutScreen(currentIndex: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Go.pop,
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.sH21),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                // child: Image.asset(
                //  // AppAssets.png.predictiveChart.path,
                // ),
                ),
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
