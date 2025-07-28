part of '../../search_imports.dart';

class SearchBottomSheetActions extends StatelessWidget {
  const SearchBottomSheetActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight, // or centerRight, center
      height: AppSizes.sH46,
      child: Row(
        children: [
          Expanded(
            child: SearchOutlinedButton(
              onTap: () {},
              text: LocaleKeys.sell.tr(),
              color: AppColors.Text,
            ),
          ),
          SizedBox(width: AppSizes.sW11),
          Expanded(
            child: SearchOutlinedButton(
              onTap: () {},
              text: LocaleKeys.tire.tr(),
              color: AppColors.Text,
            ),
          ),
        ],
      ),
    );
  }
}
