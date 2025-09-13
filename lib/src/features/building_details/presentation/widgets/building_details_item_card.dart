part of '../../building_details_imports.dart';

class BuildingDetailsItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileName;
  final String location;
  final String rate;
  final String money;
  final VoidCallback? onTap;
  BuildingDetailsItemCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.title,
    required this.profileName,
    required this.location,
    required this.rate,
    required this.money,
  });
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.only(
                left: AppSizes.sW16, right: AppSizes.sW16, top: AppSizes.sH16),
            child: SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: AppSizes.sW16,
                      top: AppSizes.sH16,
                      left: AppSizes.sW16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.svg.building.path,
                            width: AppSizes.sW20,
                            height: AppSizes.sH20,
                          ),
                          SizedBox(width: AppSizes.sW5),
                          CustomText.titleMedium(
                            title,
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColors.Text,
                                ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.sH12,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.svg.profile.path,
                                  width: AppSizes.sW20,
                                  height: AppSizes.sH20,
                                ),
                                SizedBox(width: AppSizes.sW5),
                                CustomText.titleMedium(profileName,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: AppColors.Text)),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText.titleMedium(
                                  rate,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: AppColors.Text,
                                      ),
                                ),
                                SizedBox(width: AppSizes.sW4),
                                SvgPicture.asset(
                                  AppAssets.svg.star.path,
                                  width: AppSizes.sW20,
                                  height: AppSizes.sH20,
                                ),
                              ],
                            ),
                          ]),
                      SizedBox(
                        height: AppSizes.sH12,
                      ),
                      Row(
                        spacing: 10.sp,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.svg.location.path,
                                  width: AppSizes.sW20,
                                  height: AppSizes.sH20,
                                ),
                                SizedBox(
                                  width: AppSizes.sW4,
                                ),
                                Expanded(
                                  child: CustomText.titleMedium(location,
                                      textAlign: TextAlign.start,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: AppColors.Text)
                                          .ellipsis),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.svg.money.path,
                                width: AppSizes.sW20,
                                height: AppSizes.sH20,
                              ),
                              SizedBox(
                                width: AppSizes.sW4,
                              ),
                              CustomText.titleMedium(money,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColors.Text)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
