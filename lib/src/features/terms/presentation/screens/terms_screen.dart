part of '../../terms_imports.dart';

class TermsScreen extends StatelessWidget {
  final TermsType type;

  const TermsScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermsCubit()..getData(type),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: type.title, // uses enum extension
          showBackArrow: true,
        ),
        body: const TermsBody(),
      ),
    );
  }
}
