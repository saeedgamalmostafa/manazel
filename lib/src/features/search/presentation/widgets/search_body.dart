part of '../../search_imports.dart';

class SearchBody extends StatelessWidget {
  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: FilterSearchBottomSheet(),
        );
      },
    );
  }
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: AppSizes.sW16, vertical: AppSizes.sH16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppSizes.sH48,
              child: CustomTextFormField(
                hintText: 'ابحث عن عقار',
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.sW12,vertical: AppSizes.sH15),
                  child: SvgPicture.asset(
                    AppAssets.svg.searchGray.path,
                    height: AppSizes.sH18,
                    width: AppSizes.sW18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppSizes.sW14,
          ),
          GestureDetector(
            onTap: (){
              showFilterBottomSheet(context);
            },
            child: SvgPicture.asset(
              height: AppSizes.sH48,
              width: AppSizes.sW48,
              AppAssets.svg.filter.path,
            ),
          ),
        ],
      ),
    );
  }
}
