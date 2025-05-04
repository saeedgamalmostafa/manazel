part of '../../register_imports.dart';
// class RegisterBody extends StatelessWidget {
//   const RegisterBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea( // Ensures the content is not overlapped by system UI
//         child: SingleChildScrollView(
//         child: Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: AppSizes.sH65, bottom: AppSizes.sH110),
//           child: Image.asset(AppAssets.png.manazelWhiteLogoName.path),
//         ),
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(AppRadius.bR50),
//                     topRight: Radius.circular(AppRadius.bR50))),
//             child: Column(
//               children: [
//                 AuthTitledHeader(
//                     title: Languages.currentLanguage.locale == const Locale("ar")
//                         ? "إنشاء حساب\u{1F44B}!"
//                         : "create account\u{1F44B}!",
//                     description: LocaleKeys.plzEnterRegisterData.tr()),
//                 const RegisterForms(),
//
//               ],
//             ),
//           ),
//         )
//
//       ],
//     )));
//   }
// }
//
//




class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.sH65,
                    bottom: AppSizes.sH110,
                  ),
                  child: Image.asset(AppAssets.png.manazelWhiteLogoName.path),
                ),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - AppSizes.sH65 - AppSizes.sH110,
                  ),
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
                        title: Languages.currentLanguage.locale == const Locale("ar")
                            ? "إنشاء حساب\u{1F44B}!"
                            : "Create account\u{1F44B}!",
                        description: LocaleKeys.plzEnterRegisterData.tr(),
                      ),
                      const RegisterForms(),
                       ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
