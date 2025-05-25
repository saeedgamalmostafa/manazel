part of '../../login_imports.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSizes.sH32,
          left: AppSizes.sW16,
          right: AppSizes.sW16,
          bottom: 34.h),
      child: Row(
        children: [
          Expanded(child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextFormField(
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                hintText: LocaleKeys.enterPhoneNumber.tr(),
                onChanged: (value) =>
                    context.read<LoginCubit>().onPhoneChanged(value),
              );
            },
          )),
          const CustomCountyDropDown(),
        ],
      ),
    );
  }
}
