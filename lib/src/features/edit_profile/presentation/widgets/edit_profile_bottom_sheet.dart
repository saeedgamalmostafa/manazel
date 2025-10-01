part of '../../edit_profile_imports.dart';

class EditProfileBottomSheet extends StatefulWidget {
  const EditProfileBottomSheet({super.key});

  @override
  State<EditProfileBottomSheet> createState() => _EditProfileBottomSheet();
}

class _EditProfileBottomSheet extends State<EditProfileBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Go.pop();
      Go.push(const AppLayoutScreen(currentIndex: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppAssets.lottie.done.lottie(),
          SizedBox(height: AppSizes.sH16),
          CustomText.titleLarge(
            Languages.currentLanguage.locale == const Locale("ar")
                ? "تم تحديث بياناتك بنجاح\u{1F44B}"
                : "Your data has been updated successfully\u{1F44B}",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.Text),
          ),
          SizedBox(
            height: AppSizes.sH6,
          ),
          CustomText.titleMedium(
            LocaleKeys.convertHomePage.tr(),
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.SubText),
          ),
        ],
      ),
    );
  }
}
