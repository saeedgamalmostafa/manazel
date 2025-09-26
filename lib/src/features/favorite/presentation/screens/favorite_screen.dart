part of '../../favorite_imports.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.favorite.tr(),
      ),
      body: BlocProvider.value(
        value: context.read<FavCubit>()..getFavourites(isFirst: true),
        child: const FavoriteBody(),
      ),
    );
  }
}
