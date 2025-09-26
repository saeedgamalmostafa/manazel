part of '../../building_details_imports.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final int id;
  final FavCubit? favCubit;
  const PropertyDetailsScreen({super.key, required this.id, this.favCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocProvider(
        create: (context) => PropertyDetailsCubit()..fetchPropertyDetails(id),
        child: BuildingDetailsBody(favCubit: favCubit!),
      ),
    );
  }
}
