part of '../../edit_profile_imports.dart';

class EditProfileBody extends StatelessWidget {
  EditProfileBody({
    super.key,
  });

  String? selectedCity;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomText.titleMedium(LocaleKeys.name.tr(),
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.Text, fontWeight: FontWeight.normal)),
          SizedBox(
            height: AppSizes.sH6,
          ),
          SizedBox(
            height: 48,
            child: CustomTextFormField(
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: LocaleKeys.name.tr(),
              style: TextStyle(
                fontSize: FontSize.s12,
              ),
            ),
          ),
          SizedBox(
            height: AppSizes.sH12,
          ),
          CustomText.titleMedium(LocaleKeys.email.tr(),
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.Text, fontWeight: FontWeight.normal)),
          SizedBox(
            height: AppSizes.sH6,
          ),
          SizedBox(
            height: 48,
            child: CustomTextFormField(
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText: LocaleKeys.email.tr(),
              style: TextStyle(
                fontSize: FontSize.s12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
