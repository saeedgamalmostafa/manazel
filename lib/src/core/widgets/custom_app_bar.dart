import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackArrow = false,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: AppColors.primary,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (showBackArrow) Positioned(right: 0, child: CustomBackButton()),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(116);
}
