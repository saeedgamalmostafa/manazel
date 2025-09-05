part of '../../login_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            Go.pushReplacement(const AppLayoutScreen());
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            actions: const [
              AuthLanguageStatusButton(),
            ],
          ),
          body: const LoginBody(),
        ),
      ),
    );
  }
}
