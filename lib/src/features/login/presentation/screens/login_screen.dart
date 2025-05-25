part of '../../login_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: const [
          AuthLanguageStatusButton(),
        ],
      ),
      body: const LoginBody(),
    );
  }
}
