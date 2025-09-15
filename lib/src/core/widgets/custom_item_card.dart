import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

import 'package:manazel/src/core/widgets/image_widgets/cached_image.dart';
import 'package:manazel/src/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';
import '../../config/res/app_sizes.dart';
import '../../config/res/assets.gen.dart';
import '../../config/res/color_manager.dart';
import 'custom_text.dart';

class CustomItemCard extends StatefulWidget {
  final PropertyItem propertyItem;
  final VoidCallback? onTap;
  final FavCubit? favCubit;
  const CustomItemCard({
    super.key,
    required this.propertyItem,
    required this.onTap,
    this.favCubit,
  });

  @override
  State<CustomItemCard> createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  @override
  Widget build(BuildContext context) {
    final cubit = widget.favCubit ?? context.read<FavCubit?>();

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
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r)),
                        child: CachedImage(
                          url: widget.propertyItem.images != null
                              ? ""
                              : widget.propertyItem.images!.first,
                          width: AppSizes.sW132,
                          height: AppSizes.sH128,
                        )),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sW16, vertical: AppSizes.sH16),
                        child: SizedBox(
                          height: AppSizes.sH96,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      widget.propertyItem.title,
                                      textStyle: TextStyle(
                                          fontSize: FontSize.s14,
                                          color: AppColors.Text),
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.sW20,
                                  ),
                                  BlocBuilder<FavCubit, AsyncState>(
                                    builder: (context, state) {
                                      return ValueListenableBuilder(
                                          valueListenable:
                                              widget.propertyItem.isFavourite,
                                          builder: (context, value, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                cubit.toggleFav(widget
                                                    .propertyItem.id
                                                    .toString());

                                                widget.propertyItem.isFavourite
                                                    .value = !value;
                                              },
                                              child: cubit!.isFavLoading
                                                  ? const CupertinoActivityIndicator()
                                                  : SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: SvgPicture.asset(
                                                        !widget
                                                                .propertyItem
                                                                .isFavourite
                                                                .value
                                                            ? AppAssets.svg
                                                                .favourite.path
                                                            : AppAssets
                                                                .svg
                                                                .favoritePrimary
                                                                .path,
                                                      ),
                                                    ),
                                            );
                                          });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.sH12,
                              ),
                              Row(
                                spacing: 4.w,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppAssets.svg.location.path),
                                  Expanded(
                                    child: CustomText(
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        widget.propertyItem.address,
                                        //"عالريض، حي العزيزية",
                                        textStyle: TextStyle(
                                            fontSize: FontSize.s12,
                                            color: AppColors.Text)),
                                  ),
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
                                      CustomText(widget.propertyItem.price,
                                          //"17,500 ر.س",
                                          textStyle: TextStyle(
                                              fontSize: FontSize.s12,
                                              color: AppColors.Text)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(widget.propertyItem.rate,
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
