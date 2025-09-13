part of '../../building_details_imports.dart';

class BuildingDetailsText extends StatelessWidget {
  final String dec;
  const BuildingDetailsText({super.key, required this.dec});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.sH16, horizontal: AppSizes.sW16),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svg.details.path,
                          width: AppSizes.sW20,
                          height: AppSizes.sH20,
                        ),
                        SizedBox(width: AppSizes.sW5),
                        CustomText.titleMedium(
                          LocaleKeys.buildingDetailsTitle.tr(),
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.sH4),
                    AutoSizeText(
                      dec,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.8,
                        color: AppColors.Text,
                      ),
                      maxLines: 300,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )));
  }
}
