part of '../../app_layout_imports.dart';

class AppLayoutTabs extends StatelessWidget {
  const AppLayoutTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.sH75,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.sH25),
            topRight: Radius.circular(AppSizes.sH25),
          ),
          border: const Border(top: BorderSide(color: AppColors.white))),
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
        builder: (context, state) {
          return TabBar(dividerColor: AppColors.white,
            onTap: (index) => context.read<AppLayoutCubit>().changeIndex(index),
            controller: state.controller,
            physics: const NeverScrollableScrollPhysics(),
            unselectedLabelColor: AppColors.grey,
            labelColor: AppColors.primary,
            indicatorColor: AppColors.white,
            indicatorWeight: 0.0000001,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              CustomTabItem(
                title: LocaleKeys.home.tr(),
                imagePath: AppAssets.svg.americaFlag.path,
                isSelected: state.index == 0,
              ),
              CustomTabItem(
                title: LocaleKeys.more.tr(),
                imagePath: AppAssets.svg.saudiCricularFlag.path,
                isSelected: state.index == 1,
              ),

            ],
          );
        },
      ),
    );
  }
}
