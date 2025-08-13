part of '../../my_orders_imports.dart';

class MyOrdersItemCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final String profile_name;
  final String calendar;
  final String rate;
  final VoidCallback? onTap;
  MyOrdersItemCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.description,
    required this.profile_name,
    required this.calendar,
    required this.rate,
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
              height: AppSizes.sH128,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppColors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: SizedBox(
                        width: AppSizes.sW132,
                        height: AppSizes.sH128,
                        child: Image.asset(
                          imagePath,
                          // AppAssets.png.itemPhoto.path,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sW16, vertical: AppSizes.sH16),
                        child: SizedBox(
                          height: AppSizes.sH96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppAssets.svg.building.path),
                                  Expanded(
                                    child: CustomText.titleSmall(
                                      description,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.Text),
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.sW30,
                                  ),
                                  CustomText.titleSmall(rate,
                                      //"4.8",
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.Text)),
                                  SvgPicture.asset(AppAssets.svg.star.path),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.svg.profile.path),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  CustomText.titleSmall(profile_name,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.Text)),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.svg.calendar.path),
                                  SizedBox(
                                    width: AppSizes.sW4,
                                  ),
                                  CustomText.titleSmall(calendar,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.Text)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
