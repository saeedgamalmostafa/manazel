part of '../../app_layout_imports.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<AppLayoutScreen> createState() => _AppLayoutViewState();
}

class _AppLayoutViewState extends State<AppLayoutScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<AppLayoutCubit>()..initData(this, widget.currentIndex),
      child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
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
