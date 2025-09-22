part of '../../login_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: const [
          AuthLanguageStatusButton(),
        ],
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginBody(),
      ),
    );
  }
}