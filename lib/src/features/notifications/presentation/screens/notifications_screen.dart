part of '../../notifications_imports.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.notification.tr(),
          showBackArrow: true,
        ),
        body: BlocProvider(
          create: (context) =>
              NotificationsCubit()..getNotifications(isFirst: true),
          child: const NotificationsBody(),
        ));
  }
}
