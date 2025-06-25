import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import 'custom_text.dart';
import 'package:manazel/src/config/res/assets.gen.dart';

class CustomMoreItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String imagePath;
  final bool isLogout;
  final Widget? suffixWidget;

  const CustomMoreItem({
    super.key,
    required this.title,
    this.onTap,
    required this.imagePath,
    this.isLogout = false,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.sH14, horizontal: AppSizes.sW12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.borderColor,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sW8),
                child: CustomText.titleMedium(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
            ),
            suffixWidget ??
                SvgPicture.asset(
                  AppAssets.svg.arrowLeft.path,
                  colorFilter: ColorFilter.mode(
                      isLogout ? Colors.red : AppColors.primary,
                      BlendMode.srcIn),
                ),
          ],
        ),
      ),
    );
  }
}
