import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/widgets/custom_text.dart';

class AuthTitledHeader extends StatelessWidget {
  const AuthTitledHeader(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.sH28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText.titleLarge(title),
          SizedBox(height: AppSizes.sH2),
          CustomText.titleSmall(
            description,
            textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
