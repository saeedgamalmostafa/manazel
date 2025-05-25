part of '../../register_imports.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                hintText: LocaleKeys.enterPhoneNumber.tr(),
              )),
              const CustomCountyDropDown(),
            ],
          ),
          SizedBox(height: AppSizes.sH12),
          CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LocaleKeys.enterFullName.tr(),
          ),
          SizedBox(height: AppSizes.sH12),
          CustomTextFormField(
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.enterYourEmail.tr(),
          )
        ],
      ),
    );
  }
}
