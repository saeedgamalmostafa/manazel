part of '../../search_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.search_result.tr(),
        showBackArrow: true,
      ),
      body: SearchBody(),
    );
  }
}
