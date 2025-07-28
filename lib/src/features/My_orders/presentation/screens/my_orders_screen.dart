part of '../../my_orders_imports.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: LocaleKeys.my_orders.tr(),
        showBackArrow: true,
      ),
      body: MyOrdersBody(),
    );
  }
}
