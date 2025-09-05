part of '../../login_imports.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
        child: Column(
          children: [
            LoadingButton(
                title: LocaleKeys.login,
                onTap: () async {
                  await context.read<LoginCubit>().login();
                }),
            CustomOutlinedButton(
                onPressed: () => Go.push(const RegisterScreen(),
                    transitionType: TransitionType.slideFromRight),
                text: LocaleKeys.register)
          ],
        ),
      );
    });
  }
}
