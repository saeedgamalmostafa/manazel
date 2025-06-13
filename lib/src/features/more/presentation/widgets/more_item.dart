part of '../../more_imports.dart';

class MoreItem extends StatelessWidget {
  final String title;
  final Color TextColor;
  final Color Arrowcolor;
  final VoidCallback onTap;
  final String imagePath;

  const MoreItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.TextColor,
    required this.imagePath,
    required this.Arrowcolor,
  }) : super(key: key);

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
            trailing:
                Icon(Icons.arrow_forward_ios, size: 20, color: Arrowcolor),
            onTap: onTap,
          )),
    );
  }
}
