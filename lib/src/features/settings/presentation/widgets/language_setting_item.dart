part of '../../settings_imports.dart';

class LanguageSettingItem extends StatelessWidget {
  final String title;
  final String language;
  final VoidCallback onTap;
  final String imagePath;
  final Color TextColor;

  const LanguageSettingItem({
    super.key,
    required this.title,
    required this.language,
    required this.onTap,
    required this.imagePath,
    required this.TextColor,
  });

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
                  imagePath,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                CustomText(
                  title,
                  textStyle: TextStyle(fontSize: 14, color: TextColor),
                ),
              ],
            ),
            trailing: Row(
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
            onTap: () {
              changeLanguageBottomSheet();
            },
          ),
        ));
  }
}
