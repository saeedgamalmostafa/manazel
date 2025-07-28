part of '../../my_orders_imports.dart';

class MyOrdersBody extends StatelessWidget {
  const MyOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return MyOrdersItemCard(
                imagePath: AppAssets.png.itemPhoto.path,
                description: 'عقار سكني مميز',
                profile_name: 'عالرياض، حي العزيزية',
                calendar: '17,500 ر.س',
                rate: '4.8',
              );
            }));
  }
}
