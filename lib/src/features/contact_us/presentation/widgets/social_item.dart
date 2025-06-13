part of '../../contact_us_imports.dart';

class SocialItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const SocialItem({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: 24,
        child: SvgPicture.asset(imagePath,
            width: 21.5, height: 21.5, fit: BoxFit.contain),
      ),
    );
  }
}
