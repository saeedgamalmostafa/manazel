part of '../../settings_imports.dart';

class NotificationSettingItem extends StatefulWidget {
  final String title;
  final Color TextColor;
  final String imagePath;
  const NotificationSettingItem({
    Key? key,
    required this.title,
    required this.TextColor,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<NotificationSettingItem> createState() => _NotificationSettingItem();
}

class _NotificationSettingItem extends State<NotificationSettingItem> {
  bool isSwitched = false;

  void _onSwitchChanged(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          height: 52,
          width: 343,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.borderColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
              dense: true,
              title: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.svg.elements2.path,
                  ),
                  SizedBox(width: 8),
                  CustomText(
                    LocaleKeys.notification.tr(),
                    textStyle: TextStyle(color: AppColors.Text),
                  ),
                ],
              ),
              trailing: Switch(
                value: isSwitched,
                onChanged: _onSwitchChanged,
                activeColor: AppColors.primary,
                inactiveTrackColor: Colors.transparent,
                inactiveThumbColor: AppColors.borderColor,
                splashRadius: 0.0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )),
        ));
  }
}
