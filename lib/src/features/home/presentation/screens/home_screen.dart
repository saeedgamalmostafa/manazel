part of '../imports/presentaion_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const Scaffold(
        appBar: AppbarHome(),
        backgroundColor: AppColors.scaffoldBackground,
        body: HomeBody(),
      ),
    );
  }
}
