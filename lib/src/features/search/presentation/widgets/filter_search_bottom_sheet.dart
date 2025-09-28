part of '../../search_imports.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  const FilterSearchBottomSheet({super.key});

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  String? typeId;
  String? purposeId;
  int? regionId;
  double? minPrice;
  double? maxPrice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterDataCubit, AsyncState<FilterResponse?>>(
      builder: (context, state) {
        if (state.isLoading) {
          return SizedBox(
            height: 200.h,
            child: const Center(child: CupertinoActivityIndicator()),
          );
        }
        typeId = state.data?.type.first.value;
        purposeId = state.data?.purpose.first.value;
        regionId = state.data?.cities.first.id;
        minPrice = state.data?.priceMin;
        maxPrice = state.data?.priceMax;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.sW16,
            vertical: AppSizes.sH16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 16.sp,
            children: [
              Center(
                child: CustomText(
                  LocaleKeys.searchFilter.tr(),
                  textStyle: TextStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomText(
                LocaleKeys.purpose.tr(),
                textStyle: TextStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.Text,
                ),
              ),

              /// Purpose (Sell / Rent)
              SearchBottomSheetType(
                types: state.data?.type ?? [],
                onChanged: (id) {
                  typeId = id;
                },
              ),

              /// Building type + Region
              SearchBottomSheetForms(
                buildingTypes: state.data?.purpose ?? [],
                regions: state.data?.cities ?? [],
                onBuildingTypeChanged: (id) {
                  purposeId = id;
                },
                onRegionChanged: (id) {
                  regionId = id;
                  regionId = id;
                },
              ),

              /// Price Range
              SearchBottomSheetRangeSlider(
                minPrice: state.data?.priceMin ?? 0,
                maxPrice: state.data?.priceMax ?? 0,
                onRangeChanged: (min, max) {
                  minPrice = min;
                  maxPrice = max;
                },
              ),

              /// Confirm button
              CustomElevatedButton(
                onPressed: () {
                  Go.pop({
                    "purposeId": purposeId.toString(),
                    "typeId": typeId.toString(),
                    "cityId": regionId.toString(),
                    "minPrice": minPrice?.toStringAsFixed(0),
                    "maxPrice": maxPrice?.toStringAsFixed(0),
                  });
                },
                text: LocaleKeys.sure.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
