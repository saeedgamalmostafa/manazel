part of '../../app_layout_imports.dart';

class AppLayoutScreens extends StatelessWidget {
  const AppLayoutScreens({super.key, required this.ordersIndex});

  final int ordersIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: state.controller,
                children: const [
                  HomeScreen(),
                  SettingsScreen(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
