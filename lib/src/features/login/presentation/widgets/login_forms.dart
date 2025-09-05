part of '../../login_imports.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: AppSizes.sH32,
            left: AppSizes.sW16,
            right: AppSizes.sW16,
            bottom: 34.h),
        child: Row(
          children: [
            Expanded(
                child: CustomTextFormField(
              controller: context.read<LoginCubit>().phoneController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              hintText: LocaleKeys.enterPhoneNumber.tr(),
              validator: (v) => Validators.validatePhone(v),
            )),
            const CustomCountyDropDown(),
          ],
        ),
      ),
    );
  }
}
