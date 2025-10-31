part of '../../register_imports.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes.sH65,
                          bottom: AppSizes.sH110,
                          right: AppSizes.sH20,
                          left: AppSizes.sH20),
                      child: Image.asset(
                        AppAssets.png.manazelWhiteLogoName.path,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppRadius.bR50),
                            topRight: Radius.circular(AppRadius.bR50),
                          ),
                        ),
                        child: Column(
                          children: [
                            AuthTitledHeader(
                              title: Languages.currentLanguage.locale ==
                                      const Locale("ar")
                                  ? "إنشاء حساب 👋!"
                                  : "Create Account 👋!",
                              description:
                                  LocaleKeys.pleaseEnterYourDataToRegister.tr(),
                            ),
                            const RegisterForms(),
                            const Spacer(),
                            BottomButton(
                              onTap: () async {
                                await context.read<RegisterCubit>().register();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
