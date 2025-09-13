part of '../../building_details_imports.dart';

class BuildingDetailsBody extends StatelessWidget {
  const BuildingDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, AsyncState<PropertyModel?>>(
      builder: (context, state) {
        return StatusBuilder(
          data: state,
          onSuccess: (data, context) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: Column(
                      children: [
                        BuildingDetailsImageSlider(
                          model: state.data!,
                        ),
                        BuildingDetailsItemCard(
                          imagePath: AppAssets.png.itemPhoto.path,
                          title: state.data?.title ?? '',
                          profileName: state.data?.ownerName ?? '',
                          location: state.data?.address ?? '',
                          rate: state.data?.rate ?? '',
                          money: state.data?.price ?? '',
                        ),
                        BuildingDetailsText(
                          dec: state.data?.description ?? '',
                        )
                      ],
                    )),
                BuildingDetailsBottomNavBar(
                  id: state.data?.id ?? 0,
                  phone: state.data?.ownerPhone ?? '',
                )
              ],
            );
          },
        );
      },
    );
  }
}
