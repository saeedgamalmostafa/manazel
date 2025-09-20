part of '../../otp_imports.dart';

class OtpScreen extends StatelessWidget {
  final String phone;

  const OtpScreen({super.key, required this.phone});

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
        create: (context) => OtpCubit()
          ..phone = phone
          ..sendCode(),
        child: const OtpBody(),
      ),
    );
  }
}
