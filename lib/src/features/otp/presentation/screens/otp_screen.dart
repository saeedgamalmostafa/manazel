part of '../../otp_imports.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
      body: const OtpBody(),
    );
  }
}
