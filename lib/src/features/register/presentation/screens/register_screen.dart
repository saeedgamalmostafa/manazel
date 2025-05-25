part of '../../register_imports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        // leading: Padding(
        //   padding: EdgeInsetsDirectional.only(start: AppSizes.sW20),
        //   child: InkWell(
        //     onTap: () {},
        //     splashColor: Colors.transparent,
        //     child: Container(
        //       height: AppSizes.sH40,
        //       decoration: const BoxDecoration(
        //         color: AppColors.white,
        //         shape: BoxShape.circle,
        //       ),
        //       child: const Icon(
        //         Icons.arrow_back_ios_new,
        //         color: AppColors.primary,
        //       ),
        //     ),
        //   ),
        // ),
        leading: const CustomBackButton(),
        backgroundColor: AppColors.primary,
        actions: const [
          AuthLanguageStatusButton(),
        ],
      ),
      body: const RegisterBody(),
    );
  }
}
