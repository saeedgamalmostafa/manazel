part of '../../login_imports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSizes.sH65, bottom: AppSizes.sH110),
          child: Image.asset(AppAssets.png.manazelWhiteLogoName.path,
            height: AppSizes.sH33,),
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
                      title:
                          Languages.currentLanguage.locale == const Locale("ar")
                              ? "مرحبا بعودتك\u{1F44B}!"
                              : "Welcome Back\u{1F44B}!",
                      description: LocaleKeys.plzEnterLoginData.tr()),
                  const LoginForms(),
                  const LoginActions(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
