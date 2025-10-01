part of '../../rate_imports.dart';

class RateBottomSheet extends StatelessWidget {
  const RateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.sH21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              AppAssets.png.predictiveChart.path,
            ),
          ),
          SizedBox(height: AppSizes.sH16),
          CustomText.titleLarge(
            Languages.currentLanguage.locale == const Locale("ar")
                ? "إحسب قيمة عقارك بسهولة\u{1F44B}"
                : "Calculate the value of your property easily\u{1F44B}",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.Text),
          ),
          SizedBox(
            height: AppSizes.sH6,
          ),
          CustomText.titleMedium(
            LocaleKeys.knowValueProperty.tr(),
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.SubText),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16, right: AppSizes.sW16, left: AppSizes.sW16),
            child: CustomElevatedButton(
                onPressed: () {
                  Go.push(const RateScreen());
                },
                text: LocaleKeys.continuity.tr()),
          ),
        ],
      ),
    );
  }
}
