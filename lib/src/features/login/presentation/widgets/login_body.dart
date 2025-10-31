part of '../../login_imports.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(AppAssets.png.manazelWhiteLogoName.path),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.bR50),
                topRight: Radius.circular(AppRadius.bR50),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthTitledHeader(
                      title:
                          Languages.currentLanguage.locale == const Locale("ar")
                              ? "مرحبا بعودتك\u{1F44B}!"
                              : "Welcome Back\u{1F44B}!",
                      description:
                          LocaleKeys.pleaseEnterYourLoginInformation.tr()),
                  const LoginForms(),
                  const LoginActions(),
                  AppSizes.sH100.szH,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
