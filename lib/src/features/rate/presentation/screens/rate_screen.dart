part of '../../rate_imports.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.rate.tr(),
          showBackArrow: true,
        ),
        body: const RateBody(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
              onPressed: () {
                showDefaultBottomSheet(child: const RatePriceBottomSheet());
              },
              text: LocaleKeys.send.tr(),
            )));
  }
}
