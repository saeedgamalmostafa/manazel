part of '../../search_imports.dart';

class SearchBottomSheetPriceActions extends StatelessWidget {
  const SearchBottomSheetPriceActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.sH36,
      child: Row(
        children: [
          Expanded(
            child: SearchOutlinedButton(
              onTap: () {},
              text: '10,000 ر.س',
              color: AppColors.buttonColor,
            ),
          ),
          SizedBox(width: AppSizes.sW11),
          Expanded(
            child: SearchOutlinedButton(
              onTap: () {},
              text: '20,000 ر.س',
              color: AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
