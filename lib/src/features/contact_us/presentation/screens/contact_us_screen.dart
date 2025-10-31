part of '../../contact_us_imports.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.contactUs.tr(),
          showBackArrow: true,
        ),
        body: BlocProvider(
          create: (context) => ContactUsCubit(),
          child: ContactUsBody(),
        ));
  }
}
