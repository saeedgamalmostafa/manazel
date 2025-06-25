part of '../../otp_imports.dart';

class OtpActions extends StatelessWidget {
  const OtpActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.sH16,
        horizontal: AppSizes.sW16,
      ),
      child: CustomElevatedButton(
          onPressed: () {
            Go.push(const AppLayoutScreen(currentIndex: 0));
          },
          text: LocaleKeys.confirm.tr()),
    );
  }
}
