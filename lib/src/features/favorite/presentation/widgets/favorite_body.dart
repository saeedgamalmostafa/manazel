part of '../../favorite_imports.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return CustomItemCard(
              imagePath: AppAssets.png.itemPhoto.path,
              description: 'عقار سكني مميز',
              location: 'عالرياض، حي العزيزية',
              price: '17,500 ر.س',
              rate: '4.8',
              imageFavourite: AppAssets.svg.favoritePrimary.path,
            );
          }),
    );
  }
}
