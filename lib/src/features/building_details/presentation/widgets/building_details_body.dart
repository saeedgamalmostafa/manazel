part of '../../building_details_imports.dart';

class BuildingDetailsBody extends StatelessWidget {
  const BuildingDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        BuildingDetailsImageSlider(),
        BuildingDetailsItemCard(
          imagePath: AppAssets.png.itemPhoto.path,
          description: 'عقار سكني مميز',
          profile_name: 'محمد السعيد',
          location: 'الرياض، العزيزية',
          rate: '4.8',
          money: '22,500 ر.س',
        ),
        BuildingDetailsText()
      ],
    ));
  }
}
