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
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => isOn = !isOn),
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
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: AppSizes.sW40,
                height: AppSizes.sH24,
                decoration: BoxDecoration(
                  color: isOn ? AppColors.primary : AppColors.borderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedAlign(
                    duration: Duration(milliseconds: 300),
                    alignment:
                        isOn ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: AppSizes.sW19,
                      height: AppSizes.sH19,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}

// GestureDetector(
//
// )
