part of '../../search_imports.dart';

class SearchBottomSheetPriceActions extends StatelessWidget {
  final String startValue;
  final String endValue;
  const SearchBottomSheetPriceActions(
      {super.key, required this.endValue, required this.startValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: PriceContainerWidget(
              text: startValue,
            ),
          ),
          SizedBox(width: AppSizes.sW11),
          Expanded(
            child: PriceContainerWidget(
              text: endValue,
            ),
          ),
        ],
      ),
    );
  }
}

class PriceContainerWidget extends StatelessWidget {
  final String text;
  const PriceContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 0.6, color: AppColors.grey)),
      child: CustomText.titleMedium(
        text,
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
            ),
      ),
    );
  }
}
