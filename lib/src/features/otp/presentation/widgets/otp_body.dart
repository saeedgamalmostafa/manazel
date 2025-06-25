part of '../../otp_imports.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSizes.sH65, bottom: AppSizes.sH90),
          child: Image.asset(
            AppAssets.png.manazelWhiteLogoName.path,
            height: AppSizes.sH33,
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.bR50),
                    topRight: Radius.circular(AppRadius.bR50))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthTitledHeader(
                      title: LocaleKeys.activationCode.tr(),
                      description: LocaleKeys.plzEnterActivationCode.tr()),
                  Image.asset(
                    AppAssets.gif.waveHand.path,
                    height: 150.h,
                    width: 170.w,
                  ),
                  const OtpForms(),
                ],
              ),
            ),
          ),
        ),
        const OtpActions(),
      ],
    );
  }
}
