part of '../../otp_imports.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  final OtpType otpType;
  const OtpScreen({super.key, required this.phone, required this.otpType});

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
          ..otpType = otpType
          ..sendCode(),
        child: const OtpBody(),
      ),
    );
  }
}
