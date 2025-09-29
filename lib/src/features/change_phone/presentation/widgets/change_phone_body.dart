part of '../../change_phone_imports.dart';

class ChangePhoneBody extends StatelessWidget {
  const ChangePhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChagnePhoneCubit>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: AppAssets.lottie.mobile.lottie(height: 200.h)),
                  SizedBox(
                    height: AppSizes.sH28,
                  ),
                  CustomText.titleMedium(LocaleKeys.newMobileNumber.tr(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: AppColors.Text,
                              fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: AppSizes.sH6,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        controller: cubit.phoneController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: (val) => Validators.validatePhone(val),
                        hintText: LocaleKeys.enterNewMobileNumber.tr(),
                      )),
                      const CustomCountyDropDown(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomButton(onTap: () async {
          await cubit.changeMobiel();
        })
      ],
    );
  }
}
