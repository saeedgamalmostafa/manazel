part of '../../search_imports.dart';

class SearchBottomSheetRangeSlider extends StatefulWidget {
  final double? minPrice;
  final double? maxPrice;
  final void Function(double min, double max)? onRangeChanged;

  const SearchBottomSheetRangeSlider({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    this.onRangeChanged,
  });

  @override
  State<SearchBottomSheetRangeSlider> createState() =>
      _SearchBottomSheetRangeSliderState();
}

class _SearchBottomSheetRangeSliderState
    extends State<SearchBottomSheetRangeSlider> with TickerProviderStateMixin {
  double _startValue = 10000;
  double _endValue = 20000;

  @override
  void initState() {
    super.initState();
    _startValue = widget.minPrice ?? _startValue;
    _endValue = widget.maxPrice ?? _endValue;
  }

  void _onRangeChanged(RangeValues values) {
    setState(() {
      _startValue = values.start;
      _endValue = values.end;
    });
    widget.onRangeChanged?.call(_startValue, _endValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          LocaleKeys.price.tr(),
          textStyle: TextStyle(
            fontSize: FontSize.s14,
            color: AppColors.Text,
          ),
        ),
        AppSizes.sH4.szH,
        SearchBottomSheetPriceActions(
          startValue: _startValue.toStringAsFixed(0),
          endValue: _endValue.toStringAsFixed(0),
        ),
        RangeSlider(
          values: RangeValues(_startValue, _endValue),
          min: widget.minPrice ?? 10000,
          max: widget.maxPrice ?? 20000,
          divisions: 10,
          onChanged: _onRangeChanged,
          activeColor: AppColors.buttonColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText.titleSmall(
              "ر.س ${_startValue.toInt()}",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.buttonColor),
            ),
            CustomText.titleSmall(
              "ر.س ${_endValue.toInt()}",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.buttonColor),
            ),
          ],
        ),
      ],
    );
  }
}
