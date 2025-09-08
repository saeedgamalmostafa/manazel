part of '../../rate_imports.dart';

class RateForms extends StatefulWidget {
  const RateForms({
    super.key,
  });

  @override
  State<RateForms> createState() => _RateFormsState();
}

class _RateFormsState extends State<RateForms> {
  String? selectedCity;

  Future<List<String>> getCities(String filter) async {
    return ["القاهرة", "الإسكندرية", "أسوان"]
        .where((e) => e.contains(filter))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultDropDownField<String>(
          label: LocaleKeys.region.tr(),
          hint: LocaleKeys.selectRegion.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        CustomText.titleMedium(LocaleKeys.space.tr(),
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.Text, fontWeight: FontWeight.normal)),
        SizedBox(
          height: AppSizes.sH6,
        ),
        SizedBox(
          height: 48,
          child: CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LocaleKeys.enterPropertyArea.tr(),
            style: TextStyle(
              fontSize: FontSize.s12,
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        CustomText.titleMedium(LocaleKeys.address.tr(),
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.Text, fontWeight: FontWeight.normal)),
        SizedBox(
          height: AppSizes.sH6,
        ),
        SizedBox(
          height: 48,
          child: CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LocaleKeys.enterAddress.tr(),
            style: TextStyle(
              fontSize: FontSize.s12,
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.street.tr(),
          hint: LocaleKeys.selectStreet.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.directions.tr(),
          hint: LocaleKeys.setDirections.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.interface.tr(),
          hint: LocaleKeys.selectInterface.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.buildingAge.tr(),
          hint: LocaleKeys.determineAgeBuilding.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.finishingQuality.tr(),
          hint: LocaleKeys.determineQualityFinishing.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.numberFloors.tr(),
          hint: LocaleKeys.determineNumberFloors.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.crypt.tr(),
          hint: LocaleKeys.yes.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.description.tr(),
          hint: LocaleKeys.land.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH44,
        ),
      ],
    );
  }
}
