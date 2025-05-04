part of '../../register_imports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primary,

    appBar: AppBar(
    backgroundColor: AppColors.primary,
    actions: const [
    AuthLanguageStatusButton(),
    ],

     leading: CustomArrowBackButton()
    ),
    body:  RegisterBody(),
    bottomNavigationBar: CustomBottomButton(),



    );
  }
}

