part of '../../register_imports.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    context.locale;
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: AppSizes.sH32,
            left: AppSizes.sW16,
            right: AppSizes.sW16,
            bottom: 34.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: cubit.phoneController,
                  hintText: LocaleKeys.phoneNumber.tr(),
                  validator: (v) => Validators.validatePhone(v),
                )),
                const CustomCountyDropDown(),
              ],
            ),
            SizedBox(height: AppSizes.sH12),
            CustomTextFormField(
              controller: cubit.nameController,
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: LocaleKeys.name.tr(),
              validator: (v) => Validators.validateEmpty(v),
            ),
            SizedBox(height: AppSizes.sH12),
            CustomTextFormField(
              controller: cubit.emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              hintText: LocaleKeys.email.tr(),
              // validator: (v) => Validators.validateEmail(v),
            )
          ],
        ),
      ),
    );
  }
}
