part of '../imports/presentaion_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CustomImageSlider(),
        const HomeActions(),
        const HomeItemsCard(),
      ]),
    );
  }
}
