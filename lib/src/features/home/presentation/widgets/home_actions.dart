part of '../imports/presentaion_imports.dart';

class HomeActions extends StatefulWidget {
  const HomeActions({super.key});

  @override
  State<HomeActions> createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sW16, vertical: AppSizes.sH20),
      child: Container(
        color: Colors.white,
        height: AppSizes.sH44,
        width: AppSizes.sW343,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              child: Container(
                width: 211.5,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedIndex == 0 ? AppColors.buttonColor : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: selectedIndex == 0
                        ? BorderSide.none
                        : BorderSide(color: AppColors.white, width: 2),
                    foregroundColor:
                        selectedIndex == 0 ? AppColors.white : AppColors.grey,
                  ),
                  child: CustomText(LocaleKeys.sell.tr(), textStyle: TextStyle(fontSize: FontSize.s16),),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 211.5,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 1
                        ? AppColors.buttonColor
                        : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: selectedIndex == 1
                        ? BorderSide.none
                        : BorderSide(color: AppColors.white, width: 2),
                    foregroundColor: selectedIndex == 1
                        ? AppColors.white
                        : AppColors.grey,
                  ),
                  child: CustomText(LocaleKeys.tire.tr(), textStyle: TextStyle(fontSize: FontSize.s16),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
