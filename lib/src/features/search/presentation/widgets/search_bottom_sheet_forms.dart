part of '../../search_imports.dart';

class SearchBottomSheetForms extends StatefulWidget {
  const SearchBottomSheetForms({super.key});

  @override
  State<SearchBottomSheetForms> createState() => _SearchBottomSheetFormsState();
}

class _SearchBottomSheetFormsState extends State<SearchBottomSheetForms> {
  String? selectedCity;

  Future<List<String>> getCities(String filter) async {
    return ["القاهرة", "الإسكندرية", "أسوان"]
        .where((e) => e.contains(filter))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultDropDownField<String>(
        label: LocaleKeys.buildingType.tr(),
        hint: LocaleKeys.chooseBuildingType.tr(),
        selectedItem: selectedCity,
        onChanged: (val) => setState(() => selectedCity = val),
        asyncItems: getCities,
        itemAsString: (item) => item ?? '',
      ),
      SizedBox(height: AppSizes.sH14),
      DefaultDropDownField<String>(
        label: LocaleKeys.region.tr(),
        hint: LocaleKeys.selectRegion.tr(),
        selectedItem: selectedCity,
        onChanged: (val) => setState(() => selectedCity = val),
        asyncItems: getCities,
        itemAsString: (item) => item ?? '',
      ),
    ]);
  }
}
