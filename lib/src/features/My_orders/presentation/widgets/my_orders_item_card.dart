part of '../../my_orders_imports.dart';

class MyOrdersItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String profileName;
  final String calendar;
  final String rate;
  final VoidCallback? onTap;
  const MyOrdersItemCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.title,
    required this.profileName,
    required this.calendar,
    required this.rate,
  });
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
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)),
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
                                spacing: 4.sp,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppAssets.svg.building.path),
                                  CustomText.titleSmall(
                                    title,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: AppColors.Text),
                                    maxLines: 1,
                                  ),
                                  const Spacer(),
                                  Row(
                                    spacing: 4.sp,
                                    children: [
                                      CustomText.titleSmall(rate,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: AppColors.Text)),
                                      SvgPicture.asset(AppAssets.svg.star.path),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                spacing: 4.sp,
                                children: [
                                  SvgPicture.asset(AppAssets.svg.profile.path),
                                  CustomText.titleSmall(profileName,
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
