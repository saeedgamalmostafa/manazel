part of '../../register_imports.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSizes.sH32, left: AppSizes.sW16, right: AppSizes.sW16,bottom: 34.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextFormField(
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    hintText: LocaleKeys.enterPhoneNumber.tr(),
                  )
              ),
              const CustomCountyDropDown(),
            ],
          ),

          CustomTextFormField(
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.enterName.tr(),
          ),
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.enterEmail.tr(),
          ),
          CustomTextFormField(
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.enterPassword.tr(),
          ),
          CustomTextFormField(
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.confirmPassword.tr(),
          ),
          const RegisterCheckBoxTerms()
        ],

      ),
    );
  }
}
