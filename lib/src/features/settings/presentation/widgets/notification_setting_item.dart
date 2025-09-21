part of '../../settings_imports.dart';

class NotificationSettingItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final String imagePath;
  const NotificationSettingItem({
    super.key,
    required this.title,
    this.onTap,
    required this.imagePath,
  });

  @override
  State<NotificationSettingItem> createState() =>
      _NotificationSettingItemState();
}

class _NotificationSettingItemState extends State<NotificationSettingItem> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    var isOn = cubit.userCubit.user.preferences?.notification ?? false;
    return Center(
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.sH14, horizontal: AppSizes.sW12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.borderColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.imagePath,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.sW8),
                  child: CustomText.titleMedium(
                    widget.title,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cubit.userCubit.user.preferences?.notification = !isOn;
                  cubit.changeNotifier(!isOn);
                  setState(() {
                    isOn = !isOn;
                  });
                },
                child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.sW4),
                    duration: const Duration(milliseconds: 200),
                    width: 50.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: isOn ? AppColors.primary : AppColors.borderColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AnimatedAlign(
                        duration: const Duration(milliseconds: 200),
                        alignment:
                            isOn ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          width: AppSizes.sW20,
                          height: AppSizes.sH20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
//
// )
