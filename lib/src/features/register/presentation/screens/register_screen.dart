part of '../../register_imports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<RegisterCubit>(),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.requestState == RequestState.success) {
              /// TODO : navigate to opt screen.
              Go.push(const HomeScreen());
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(

              leading: const CustomBackButton(),
              backgroundColor: AppColors.primary,
              actions: const [
                AuthLanguageStatusButton(),
              ],
            ),
            body: const RegisterBody(),
          ),
        ));
  }
}
