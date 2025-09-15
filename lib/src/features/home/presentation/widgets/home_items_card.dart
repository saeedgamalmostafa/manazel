part of '../imports/presentaion_imports.dart';

class HomeItemsCard extends StatelessWidget {
  final Properties properties;
  final int tabIndex; // rename for clarity
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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: BlocProvider(
                  create: (context) => FavCubit(),
                  child: CustomItemCard(
                    propertyItem: items[i],
                    onTap: () => Go.push(PropertyDetailsScreen(
                      id: items[i].id,
                    )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
