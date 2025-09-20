part of '../../search_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.searchResult.tr(),
        showBackArrow: true,
      ),
      body: BlocProvider(
        create: (context) => FilterCubit()..getPropertyByFilter(isFirst: true),
        child: const SearchBody(),
      ),
    );
  }
}
