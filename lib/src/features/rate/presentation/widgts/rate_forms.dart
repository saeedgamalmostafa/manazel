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
          hint: LocaleKeys.select_region.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        CustomText(LocaleKeys.space.tr(),
            textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.Text,
                fontWeight: FontWeight.normal)),
        SizedBox(
          height: AppSizes.sH6,
        ),
        Container(
          height: 48,
          child: CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LocaleKeys.enter_property_area.tr(),
            style: TextStyle(
              fontSize: FontSize.s12,
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        CustomText(LocaleKeys.address.tr(),
            textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.Text,
                fontWeight: FontWeight.normal)),
        SizedBox(
          height: AppSizes.sH6,
        ),
        Container(
          height: 48,
          child: CustomTextFormField(
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LocaleKeys.enter_address.tr(),
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
          hint: LocaleKeys.select_street.tr(),
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
          hint: LocaleKeys.set_directions.tr(),
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
          hint: LocaleKeys.select_interface.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.building_age.tr(),
          hint: LocaleKeys.determine_age_building.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.finishing_quality.tr(),
          hint: LocaleKeys.determine_quality_finishing.tr(),
          selectedItem: selectedCity,
          onChanged: (val) => setState(() => selectedCity = val),
          asyncItems: getCities,
          itemAsString: (item) => item ?? '',
        ),
        SizedBox(
          height: AppSizes.sH14,
        ),
        DefaultDropDownField<String>(
          label: LocaleKeys.number_floors.tr(),
          hint: LocaleKeys.determine_number_floors.tr(),
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
