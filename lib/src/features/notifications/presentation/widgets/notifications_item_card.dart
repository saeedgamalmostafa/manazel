part of '../../notifications_imports.dart';

class NotificationsItemCard extends StatelessWidget {
  const NotificationsItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.sH8, horizontal: AppSizes.sW8),
          child: SizedBox(
            height: AppSizes.sH62,
            width: AppSizes.sW343,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: AppSizes.sW8,
                        top: AppSizes.sH9,
                        bottom: AppSizes.sH9),
                    child: SvgPicture.asset(
                      AppAssets.svg.notificationCircle.path,
                      height: AppSizes.sH44,
                      width: AppSizes.sW44,
                    ),
                  ),
                  Expanded(
                    child: CustomText.titleSmall(
                      "لديك موعد لمعاينة العقار يوم السبت",
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                              color: AppColors.TextBold,
                              fontWeight: FontWeight.normal),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: AppSizes.sW30),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppSizes.sW12,
                        top: AppSizes.sH21,
                        bottom: AppSizes.sH21),
                    child: SvgPicture.asset(
                      AppAssets.svg.cancelCircle.path,
                      height: AppSizes.sH20,
                      width: AppSizes.sW20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
