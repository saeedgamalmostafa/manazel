part of '../../search_imports.dart';

class SearchBottomSheetRangeSlider extends StatefulWidget {
  const SearchBottomSheetRangeSlider({super.key});

  @override
  State<SearchBottomSheetRangeSlider> createState() =>
      _SearchBottomSheetRangeSliderState();
}

class _SearchBottomSheetRangeSliderState
    extends State<SearchBottomSheetRangeSlider> with TickerProviderStateMixin {
  TabController? _tabController;
  double _startValue = 10000;
  double _endValue = 20000;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: RangeValues(_startValue, _endValue),
          min: 10000,
          max: 20000,
          divisions: 10,
          labels: RangeLabels(
              "${_startValue.toInt()} ر.س", "${_endValue.toInt()} ر.س"),
          onChanged: (RangeValues values) {
            setState(() {
              _startValue = values.start;
              _endValue = values.end;
            });
          },
          activeColor: AppColors.buttonColor,
          //inactiveColor: Colors.blue[100],
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
