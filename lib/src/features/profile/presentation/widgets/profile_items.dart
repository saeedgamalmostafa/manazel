part of '../../profile_imports.dart';

class MoreItem extends StatelessWidget {
  final String title;
  final Color TextColor;
  final String imagePath;

  const MoreItem({
    Key? key,
    required this.title,
    required this.TextColor,
    required this.imagePath,
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
                      width: 23,
                      height: 23,
                    ),
                    SizedBox(width: 8),
                    CustomText(
                      title,
                      textStyle: TextStyle(fontSize: 14, color: TextColor),
                    ),
                  ],
                ))));
  }
}
