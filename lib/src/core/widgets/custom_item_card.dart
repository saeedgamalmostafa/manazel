import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/res/app_sizes.dart';
import '../../config/res/assets.gen.dart';
import '../../config/res/color_manager.dart';
import 'custom_text.dart';

class CustomItemCard extends StatefulWidget {
  final String imagePath;
  final String description;
  final String imageFavourite;
  final String location;
  final String price;
  final String rate;
  final VoidCallback? onTap;
  const CustomItemCard(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.description,
      required this.location,
      required this.price,
      required this.rate,
      required this.imageFavourite});

  @override
  State<CustomItemCard> createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Padding(
            padding: EdgeInsets.only(
                left: AppSizes.sW16, right: AppSizes.sW16, top: AppSizes.sH16),
            child: SizedBox(
              height: AppSizes.sH128,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppColors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Container(
                        width: AppSizes.sW132,
                        height: AppSizes.sH128,
                        child: Image.asset(
                          widget.imagePath,
                          // AppAssets.png.itemPhoto.path,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sW16, vertical: AppSizes.sH16),
                        child: Container(
                          height: AppSizes.sH96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      widget.description,
                                      textStyle: TextStyle(
                                          fontSize: FontSize.s14,
                                          color: AppColors.Text),
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.sW20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFavourite = !isFavourite;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: SvgPicture.asset(
                                        !isFavourite
                                            ? AppAssets.svg.favourite.path
                                            : AppAssets
                                                .svg.favoritePrimary.path,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.svg.location.path),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  CustomText(widget.location,
                                      //"عالرياض، حي العزيزية",
                                      textStyle: TextStyle(
                                          fontSize: FontSize.s12,
                                          color: AppColors.Text)),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          AppAssets.svg.money.path),
                                      SizedBox(
                                        width: AppSizes.sW4,
                                      ),
                                      CustomText(widget.price,
                                          //"17,500 ر.س",
                                          textStyle: TextStyle(
                                              fontSize: FontSize.s12,
                                              color: AppColors.Text)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(widget.rate,
                                          //"4.8",
                                          textStyle: TextStyle(
                                              fontSize: FontSize.s12,
                                              color: AppColors.Text)),
                                      SvgPicture.asset(AppAssets.svg.star.path),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
