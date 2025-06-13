part of '../../more_imports.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.more.tr(),
        ),
        body: MoreBody());
  }
}
