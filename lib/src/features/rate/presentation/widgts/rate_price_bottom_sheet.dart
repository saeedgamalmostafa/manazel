part of '../../rate_imports.dart';

class RatePriceBottomSheet extends StatefulWidget {
  const RatePriceBottomSheet({super.key});

  @override
  State<RatePriceBottomSheet> createState() => _RatePriceBottomSheet();
}

class _RatePriceBottomSheet extends State<RatePriceBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Go.pop();
      Go.push(AppLayoutScreen(currentIndex: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Go.pop,
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.sH21),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                AppAssets.png.buildingPrice.path,
              ),
            ),
            SizedBox(height: AppSizes.sH16),
            CustomText.titleLarge(
              Languages.currentLanguage.locale == const Locale("ar")
                  ? "قيمة عقارك 27,000 ر.س\u{1F44B}"
                  : "Your property value is 27,000 SAR\u{1F44B}",
              textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.Text),
            ),
            SizedBox(
              height: AppSizes.sH6,
            ),
            CustomText.titleMedium(
              LocaleKeys.wishUniqueExperience.tr(),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.SubText),
            ),
          ],
        ),
      ),
    );
  }
}
