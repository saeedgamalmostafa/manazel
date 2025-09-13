part of '../../building_details_imports.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final int id;
  const PropertyDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocProvider(
        create: (context) => PropertyDetailsCubit()..fetchPropertyDetails(id),
        child: const BuildingDetailsBody(),
      ),
    );
  }
}
