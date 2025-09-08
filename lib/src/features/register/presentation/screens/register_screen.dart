part of '../../register_imports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: AppColors.primary,
        actions: const [
          AuthLanguageStatusButton(),
        ],
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const RegisterBody(),
      ),
    );
  }
}
