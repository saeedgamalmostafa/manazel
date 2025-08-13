part of '../imports/presentaion_imports.dart';

class HomeActions extends StatefulWidget {
  const HomeActions({super.key});

  @override
  State<HomeActions> createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabTitles = [LocaleKeys.tire.tr(), LocaleKeys.sell.tr()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild on tab change
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.sH20,
        horizontal: AppSizes.sW16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(tabTitles.length, (index) {
          bool selected = _tabController.index == index;

          return InkWell(
              onTap: () => _onTabTapped(index),
              child: Container(
                height: 44,
                width: 170,
                decoration: BoxDecoration(
                  color: selected ? AppColors.buttonColor : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.grey, width: 0.5),
                ),
                child: Center(
                  child: CustomText.titleLarge(
                    tabTitles[index],
                    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: selected ? Colors.white : AppColors.grey,
                        ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
