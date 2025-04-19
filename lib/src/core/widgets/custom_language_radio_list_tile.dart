import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final String imagePath;
  final ValueChanged<T?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(AppRadius.bR6),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.sH9, horizontal: AppSizes.sW15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.bR6),
          border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.grey,
              width: AppSizes.sW1),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              height: AppSizes.sH30,
              width: AppSizes.sW30,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: AppSizes.sW10),
                child: CustomText.headlineSmall(title,
                    textAlign: TextAlign.start,
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.grey)),
              ),
            ),
            Container(
                height: AppSizes.sH22,
                width: AppSizes.sW22,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelected ? AppColors.primary : Colors.transparent,
                    width: AppSizes.sW1,
                  ),
                ),
                child: (isSelected
                    ? Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: AppRadius.bR18,
                      )
                    : const SizedBox())),
          ],
        ),
      ),
    );
  }
}
