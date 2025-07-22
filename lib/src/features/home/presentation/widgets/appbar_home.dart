part of '../imports/presentaion_imports.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sW24, vertical: AppSizes.sH26),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  Languages.currentLanguage.locale == const Locale("ar")
                      ? "مرحباً بك\u{1F44B}!"
                      : "Welcome \u{1F44B}!",
                  textStyle: TextStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: AppSizes.sH5),
                Row(
                  children: [
                    CustomText(
                      'في',
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    SizedBox(width: 4),
                    Image.asset(
                      AppAssets.png.manazelWhiteLogoName.path,
                      height: AppSizes.sH12,
                      width: AppSizes.sW88,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomCirclurButton(imagepath: AppAssets.svg.search.path),
          SizedBox(width: 10),
          CustomCirclurButton(
              imagepath: AppAssets.svg.notificationPrimary.path),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);
}
