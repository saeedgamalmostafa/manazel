part of '../../change_phone_imports.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.changePhone.tr(),
        showBackArrow: true,
      ),
      body: BlocProvider(
        create: (context) => ChagnePhoneCubit(),
        child: const ChangePhoneBody(),
      ),
    );
  }
}
