part of '../../edit_profile_imports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.editProfile.tr(),
          showBackArrow: true,
        ),
        body: BlocProvider(
          create: (context) => EditProfileCubit(),
          child: const EditProfileBody(),
        ));
  }
}
