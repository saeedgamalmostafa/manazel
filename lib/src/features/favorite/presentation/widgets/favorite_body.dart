part of '../../favorite_imports.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, AsyncState<List<FavouriteModel>>>(
      builder: (context, state) {
        return StatusBuilder(
            shamierWidget: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) => const CustomItemCardShimmer(),
            ),
            data: state,
            onSuccess: (data, context) {
              if (state.data.isEmpty) {
                return const NotContainData();
              }
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomItemCard(
                      propertyItem: state.data[index].property,
                      onTap: () {
                        Go.push(const BuildingDetailsScreen());
                      },
                    );
                  });
            });
      },
    );
  }
}

class CustomItemCardShimmer extends StatelessWidget {
  const CustomItemCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.sW16,
        right: AppSizes.sW16,
        top: AppSizes.sH16,
      ),
      child: SizedBox(
        height: AppSizes.sH128,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼 image shimmer
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                child: const CustomShimmer(
                  width: 132, // AppSizes.sW132
                  height: 128, // AppSizes.sH128
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.sW16,
                    vertical: AppSizes.sH16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 📝 title + fav button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: CustomShimmer(
                              height: 14,
                              width: 100,
                              margin: 0,
                            ),
                          ),
                          SizedBox(width: AppSizes.sW20),
                          const CustomShimmer(
                            height: 30,
                            width: 30,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            margin: 0,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.sH12),

                      // 📍 address
                      const CustomShimmer(
                        height: 12,
                        width: 140,
                        margin: 0,
                      ),
                      SizedBox(height: AppSizes.sH12),

                      // 💰 price + ⭐ rate
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomShimmer(
                            height: 12,
                            width: 60,
                            margin: 0,
                          ),
                          CustomShimmer(
                            height: 12,
                            width: 30,
                            margin: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
