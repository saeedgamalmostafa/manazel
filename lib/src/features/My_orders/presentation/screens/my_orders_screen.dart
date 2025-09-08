part of '../../my_orders_imports.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: LocaleKeys.myOrders.tr(),
        showBackArrow: true,
      ),
      body: MyOrdersBody(),
    );
  }
}
