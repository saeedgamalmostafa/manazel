part of '../../notifications_imports.dart';

class NotificationsItemCard extends StatelessWidget {
  final NotificationModel model;
  const NotificationsItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.sH8, horizontal: AppSizes.sW8),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.white,
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.svg.notificationCircle.path,
                    height: AppSizes.sH30, width: AppSizes.sW30),
                title: CustomText.titleSmall(
                  textAlign: TextAlign.start,
                  model.message,
                  textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.TextBold,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
                trailing: InkWell(
                  onTap: () {
                    context
                        .read<NotificationsCubit>()
                        .deleteNotification(model.id);
                  },
                  child: SvgPicture.asset(
                    AppAssets.svg.cancelCircle.path,
                    height: AppSizes.sH20,
                    width: AppSizes.sW20,
                  ),
                ),
              )),
        ));
  }
}
