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
          CustomText(
            Languages.currentLanguage.locale == const Locale("ar")
                ? "إحسب قيمة عقارك بسهولة\u{1F44B}"
                : "Calculate the value of your property easily\u{1F44B}",
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSize.s16,
                color: AppColors.Text),
          ),
          SizedBox(
            height: AppSizes.sH6,
          ),
          CustomText(
            LocaleKeys.know_value_property.tr(),
            textStyle:
                TextStyle(fontSize: FontSize.s14, color: AppColors.SubText),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
                onPressed: () {
                  Go.push(RateScreen());
                }, text: LocaleKeys.continuity.tr()),
          ),
        ],
      ),
    );
  }
}
