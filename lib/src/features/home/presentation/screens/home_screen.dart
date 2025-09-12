part of '../imports/presentaion_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHome(),
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeBody(),
      ),
    );
  }
}
