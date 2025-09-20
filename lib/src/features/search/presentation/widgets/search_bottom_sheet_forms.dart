part of '../../search_imports.dart';

class SearchBottomSheetForms extends StatefulWidget {
  const SearchBottomSheetForms({
    super.key,
    required this.buildingTypes,
    required this.regions,
    this.onBuildingTypeChanged,
    this.onRegionChanged,
  });

  final List<DropDownItem> buildingTypes;
  final List<DropDownItem> regions;
  final ValueChanged<int?>? onBuildingTypeChanged;
  final ValueChanged<int?>? onRegionChanged;

  @override
  State<SearchBottomSheetForms> createState() => _SearchBottomSheetFormsState();
}

class _SearchBottomSheetFormsState extends State<SearchBottomSheetForms> {
  DropDownItem? selectedBuildingType;
  DropDownItem? selectedRegion;

  @override
  void initState() {
    super.initState();
    if (widget.buildingTypes.isNotEmpty) {
      selectedBuildingType = widget.buildingTypes.first;
      widget.onBuildingTypeChanged?.call(selectedBuildingType?.id);
    }
    if (widget.regions.isNotEmpty) {
      selectedRegion = widget.regions.first;
      widget.onRegionChanged?.call(selectedRegion?.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultDropDownField<DropDownItem>(
        label: LocaleKeys.buildingType.tr(),
        hint: LocaleKeys.chooseBuildingType.tr(),
        selectedItem: selectedBuildingType,
        onChanged: (val) {
          setState(() => selectedBuildingType = val);
          widget.onBuildingTypeChanged?.call(val?.id);
        },
        asyncItems: (f) async {
          return widget.buildingTypes;
        },
        itemAsString: (item) => item?.name ?? '',
      ),
      SizedBox(height: AppSizes.sH14),
      DefaultDropDownField<DropDownItem>(
        label: LocaleKeys.region.tr(),
        hint: LocaleKeys.selectRegion.tr(),
        selectedItem: selectedRegion,
        onChanged: (val) {
          setState(() => selectedRegion = val);
          widget.onRegionChanged?.call(val?.id);
        },
        asyncItems: (f) async {
          return widget.regions;
        },
        itemAsString: (item) => item?.name ?? '',
      ),
    ]);
  }
}
