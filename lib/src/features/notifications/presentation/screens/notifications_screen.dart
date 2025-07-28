part of '../../notifications_imports.dart';
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(title: LocaleKeys.notification.tr(),showBackArrow: true,),
      body: NotificationsBody(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              vertical:AppSizes.sH40,
            ),
            child:SvgPicture.asset(
              AppAssets.svg.cancelButton.path,height: AppSizes.sH65,
              width: AppSizes.sW65,
            ))

    );
  }
}
