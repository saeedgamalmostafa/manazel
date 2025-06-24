part of '../../more_imports.dart';

class MoreItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String imagePath;
  final bool isLogout;
  final Widget? suffixWidget;

  const MoreItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.imagePath,
    this.isLogout = false,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              imagePath,
              width: AppSizes.sW24,
              height: AppSizes.sH24,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sW8),
                child: CustomText.titleMedium(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
            ),
            suffixWidget ??
                SvgPicture.asset(
                  AppAssets.svg.arrowLeft.path,
                  colorFilter: ColorFilter.mode(
                      isLogout ? Colors.red : AppColors.primary,
                      BlendMode.srcIn),
                ),
          ],
        ),
      ),
    );
  }
}
