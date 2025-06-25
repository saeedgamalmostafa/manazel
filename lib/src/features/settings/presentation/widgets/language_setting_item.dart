part of '../../settings_imports.dart';

class LanguageSettingItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String imagePath;

  const LanguageSettingItem({
    super.key,
    required this.title,
    this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeLanguageBottomSheet();
      },
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText.titleSmall(
                  Languages.currentLanguage.locale == const Locale("ar")
                      ? LocaleKeys.arabic.tr()
                      : LocaleKeys.english.tr(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.black, fontSize: FontSize.s12),
                ),
                const SizedBox(width: 8),
                Languages.currentLanguage.locale == const Locale("ar")
                    ? AppAssets.svg.saudiSquareFlag.svg(height: 16, width: 24)
                    : AppAssets.svg.americaFlag.svg(height: 16, width: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
