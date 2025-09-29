part of '../../my_orders_imports.dart';

class MyOrdersItemCard extends StatelessWidget {
  final String orderImage;
  final String title;
  final String profileName;
  final String calendar;
  final String rate;
  final VoidCallback? onTap;
  const MyOrdersItemCard({
    super.key,
    this.onTap,
    required this.orderImage,
    required this.title,
    required this.profileName,
    required this.calendar,
    required this.rate,
  });
  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
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
                          topRight:
                              isArabic ? Radius.circular(20.r) : Radius.zero,
                          bottomRight:
                              isArabic ? Radius.circular(20.r) : Radius.zero,
                          topLeft:
                              !isArabic ? Radius.circular(20.r) : Radius.zero,
                          bottomLeft:
                              !isArabic ? Radius.circular(20.r) : Radius.zero,
                        ),
                        child: CachedImage(
                          url: orderImage,
                          width: AppSizes.sW132,
                          height: AppSizes.sH128,
                        )),
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
                                  Expanded(
                                    child: CustomText.titleSmall(
                                      title,
                                      textAlign: TextAlign.start,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.Text),
                                      maxLines: 1,
                                    ),
                                  ),
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
