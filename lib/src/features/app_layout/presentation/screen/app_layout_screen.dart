part of '../../app_layout_imports.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key, this.currentIndex = 0});
  final int currentIndex;
  @override
  State<AppLayoutScreen> createState() => _AppLayoutViewState();
}

class _AppLayoutViewState extends State<AppLayoutScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLayoutCubit>(
          create: (context) =>
              AppLayoutCubit()..initData(this, widget.currentIndex),
        ),
        BlocProvider<FavCubit>(create: (context) => FavCubit()),
      ],
      child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Scaffold(
              body: AppLayoutScreens(ordersIndex: state.index),
              bottomNavigationBar: const AppLayoutTabs(),
            ),
          );
        },
      ),
    );
  }
}
