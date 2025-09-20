part of '../imports/presentaion_imports.dart';

class HomeActions extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;

  const HomeActions({super.key, this.onTabChanged});

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
      if (_tabController.indexIsChanging) return; // avoid double calls
      widget.onTabChanged?.call(_tabController.index);
      setState(() {}); // rebuild for UI
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {}); // rebuild for UI

    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppMargin.mH16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: List.generate(tabTitles.length, (index) {
          bool selected = _tabController.index == index;

          return Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => _onTabTapped(index),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: selected ? AppColors.buttonColor : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: CustomText.titleLarge(
                    tabTitles[index],
                    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: selected ? Colors.white : AppColors.grey,
                        ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
