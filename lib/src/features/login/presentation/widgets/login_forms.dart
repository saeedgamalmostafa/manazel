part of '../../login_imports.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

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
              )),
              const CustomCountyDropDown(),
            ],
          ),
        ],
      ),
    );
  }
}
