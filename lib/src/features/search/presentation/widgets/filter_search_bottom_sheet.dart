part of '../../search_imports.dart';

class FilterSearchBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.sH566,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sW16, vertical: AppSizes.sH16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CustomText(LocaleKeys.search_filter.tr(),
                textStyle: TextStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: AppSizes.sH18),
          CustomText(LocaleKeys.purpose.tr(),
              textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.Text,
              )),
          SizedBox(height: AppSizes.sH6),
          SearchBottomSheetActions(),
          SizedBox(height: AppSizes.sH4),
          SearchBottomSheetForms(),
          SizedBox(height: AppSizes.sH14),
          CustomText(LocaleKeys.price.tr(),
              textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.Text,
              )),
          SizedBox(height: AppSizes.sH6),

          SearchBottomSheetPriceActions(),
          SizedBox(height: AppSizes.sH18),

          SearchBottomSheetRangeSlider(),
          Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
                onPressed: () {
                  Go.pop();
                }, text: LocaleKeys.sure.tr()),
          ),
        ],
      ),
    );
  }
}
