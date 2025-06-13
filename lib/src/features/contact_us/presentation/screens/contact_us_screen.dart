part of '../../contact_us_imports.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactUsCubit(),
      child: Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: CustomAppBar(
            title: LocaleKeys.contact_us.tr(),
            showBackArrow: true,
          ),
          body: ContactUsBody()),
    );
  }
}
