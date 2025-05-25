part of '../../app_layout_imports.dart';

class CustomTabItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final bool isBadged;

  const CustomTabItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
        height: AppSizes.sH75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: AppSizes.sH30,
              width: AppSizes.sW30,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            // SizedBox(height: AppSizes.sH5),
            CustomText.titleSmall(
              title,
              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  // fontSize: 12.sp,
                  color: isSelected ? AppColors.primary : AppColors.grey),
            ),
          ],
        ));
  }
}
