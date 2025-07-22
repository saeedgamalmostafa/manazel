part of '../imports/presentaion_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarHome(),
      backgroundColor: AppColors.scaffoldBackground,
      body: HomeBody(),
    );
  }
}
