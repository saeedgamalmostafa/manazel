part of '../../register_imports.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: AppSizes.sH65, bottom: AppSizes.sH110),
                child: Image.asset(
                  AppAssets.png.manazelWhiteLogoName.path,
                  height: AppSizes.sH33,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppRadius.bR50),
                        topRight: Radius.circular(AppRadius.bR50))),
                child: Column(
                  children: [
                    AuthTitledHeader(
                        title: Languages.currentLanguage.locale ==
                                const Locale("ar")
                            ? "إنشاء حساب\u{1F44B}!"
                            : "Create Account\u{1F44B}!",
                        description:
                            LocaleKeys.plzEnterYourDataToRegister.tr()),
                    const RegisterForms(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const RegisterActions(),
      ],
    );
  }
}
