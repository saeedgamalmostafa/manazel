part of '../../search_imports.dart';

class SearchOutlinedButton extends StatelessWidget {
  const SearchOutlinedButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
    this.borderRadius,
    this.width,
    this.height,
    required this.color,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        fixedSize: Size(width ?? 166.h, height ?? 46.h),
        side: BorderSide(
          color: isSelected ? AppColors.buttonColor : AppColors.grey,
          width: 0.6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        ),
        backgroundColor:
            isSelected ? AppColors.buttonColor.withAlpha(30) : Colors.white,
      ),
      child: CustomText.titleMedium(
        text,
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
            ),
      ),
    );
  }
}
