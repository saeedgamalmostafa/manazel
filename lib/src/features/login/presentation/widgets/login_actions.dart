part of '../../login_imports.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
      child: Column(
        children: [
          CustomElevatedButton(onPressed: () {}, text: LocaleKeys.login.tr()),
          SizedBox(height: AppSizes.sH12),
          CustomOutlinedButton(onPressed: () {}, text: LocaleKeys.register.tr())
        ],
      ),
    );
  }
}
