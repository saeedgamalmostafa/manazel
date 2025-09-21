part of '../../change_password_imports.dart';

class ChangePhoneBody extends StatelessWidget {
  const ChangePhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSizes.sH32,
          left: AppSizes.sW16,
          right: AppSizes.sW16,
          bottom: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSizes.sH120,
          ),
          Center(
            child: Container(
              child: Image.asset(
                'assets/gif/change_password.gif',
                width: 272,
                height: 236,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: AppSizes.sH28,
          ),
          CustomText.titleMedium(LocaleKeys.newMobileNumber.tr(),
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.Text, fontWeight: FontWeight.normal)),
          SizedBox(
            height: AppSizes.sH6,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextFormField(
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                hintText: LocaleKeys.enterNewMobileNumber.tr(),
              )),
              const CustomCountyDropDown(),
            ],
          ),
        ],
      ),
    );
  }
}
