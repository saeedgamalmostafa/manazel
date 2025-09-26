part of '../imports/presentaion_imports.dart';

class HomeItemsCard extends StatelessWidget {
  final Properties properties;
  final int tabIndex;
  const HomeItemsCard({
    super.key,
    required this.properties,
    this.tabIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final items = tabIndex == 0 ? properties.rent : properties.buy;

    return AnimationLimiter(
      child: ListView.builder(
        key: ValueKey<int>(tabIndex),
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 20.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: CustomItemCard(
                  propertyItem: items[i],
                  onTap: () => Go.push(PropertyDetailsScreen(
                    favCubit: context.read<FavCubit>(),
                    id: items[i].id,
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
