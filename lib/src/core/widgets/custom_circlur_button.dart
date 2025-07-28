import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';

class CustomCirclurButton extends StatelessWidget {
  final String imagepath;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const CustomCirclurButton(
      {super.key,
      required this.imagepath,
      this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.bR100),
      child: Container(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.antiAlias,
        height: height,
        width:width,
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
