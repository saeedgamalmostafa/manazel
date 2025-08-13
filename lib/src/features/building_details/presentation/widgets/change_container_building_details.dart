part of '../../building_details_imports.dart';

class ChangeContainerBuildingDetails extends StatelessWidget {
  final Color color;
  final Color background_color;
  final String text;
  const ChangeContainerBuildingDetails(
      {super.key,
      required this.color,
      required this.background_color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.sH35, // Ensure this is equal to width
      width: AppSizes.sH70, // Use same value to keep it a circle
      decoration: BoxDecoration(
          color: background_color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: CustomText.titleMedium(
          text,
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color,
              ),
        ),
      ),
    );
  }
}
