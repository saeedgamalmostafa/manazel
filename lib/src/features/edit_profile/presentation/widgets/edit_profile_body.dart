part of '../../edit_profile_imports.dart';

// ignore: must_be_immutable
class EditProfileBody extends StatelessWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.titleMedium(LocaleKeys.name.tr(),
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            color: AppColors.Text,
                            fontWeight: FontWeight.normal)),
                SizedBox(
                  height: AppSizes.sH6,
                ),
                SizedBox(
                  height: 48.h,
                  child: CustomTextFormField(
                    controller: cubit.nameController,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.done,
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
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            color: AppColors.Text,
                            fontWeight: FontWeight.normal)),
                SizedBox(
                  height: AppSizes.sH6,
                ),
                if (cubit.userCubit.user.email != null &&
                    cubit.userCubit.user.email!.isNotEmpty)
                  SizedBox(
                    height: 48.h,
                    child: CustomTextFormField(
                      controller: cubit.emailController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      hintText: LocaleKeys.email.tr(),
                      style: TextStyle(
                        fontSize: FontSize.s12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        BottomButton(onTap: () async {
          await context.read<EditProfileCubit>().editProfile();
        })
      ],
    );
  }
}
