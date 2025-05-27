part of '../../register_imports.dart';

class RegisterActions extends StatelessWidget {
  const RegisterActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16,vertical: AppSizes.sH16),
      child:
          CustomElevatedButton(
              onPressed: () => context.read<RegisterCubit>().register(),
              text: LocaleKeys.register.tr()),
    );
  }
}
