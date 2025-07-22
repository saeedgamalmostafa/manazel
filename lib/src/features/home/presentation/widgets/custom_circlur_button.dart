part of '../imports/presentaion_imports.dart';

class CustomCirclurButton extends StatelessWidget {
  final String imagepath;
  final VoidCallback? onTap;

  const CustomCirclurButton({super.key, required this.imagepath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.bR100),
      child: Container(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.antiAlias,
        height: AppSizes.sH44,
        width: AppSizes.sW44,
        //margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            imagepath,
          ),
        ),
      ),
    );
  }
}
