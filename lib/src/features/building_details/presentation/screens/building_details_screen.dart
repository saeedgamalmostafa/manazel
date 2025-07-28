part of '../../building_details_imports.dart';
class BuildingDetailsScreen extends StatelessWidget {
  const BuildingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BuildingDetailsBody(),
      bottomNavigationBar: BuildingDetailsBottomNavBar()
    );
  }
}

