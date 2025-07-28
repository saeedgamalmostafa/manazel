part of '../imports/presentaion_imports.dart';

class HomeItemsCard extends StatelessWidget {
  const HomeItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            imageFavourite: AppAssets.svg.favourite.path,
            onTap: (){
              Go.push(const BuildingDetailsScreen());
            },
          );
        });
  }
}
