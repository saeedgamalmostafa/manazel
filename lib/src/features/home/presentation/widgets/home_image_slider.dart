import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manazel/src/config/res/app_sizes.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';
import 'package:manazel/src/core/widgets/image_widgets/cached_image.dart';
import 'package:manazel/src/features/home/presentation/imports/presentaion_imports.dart';

import '../../../../config/res/color_manager.dart';

class CustomImageSlider extends StatefulWidget {
  final List<Advertisement> advertisement;
  const CustomImageSlider({super.key, required this.advertisement});

  @override
  CustomImageSliderState createState() => CustomImageSliderState();
}

class CustomImageSliderState extends State<CustomImageSlider> {
  final List<String> images = [
    'https://picsum.photos/id/1015/600/300',
    'https://picsum.photos/id/1016/600/300',
    'https://picsum.photos/id/1018/600/300',
    'https://picsum.photos/id/1015/600/300',
    'https://picsum.photos/id/1016/600/300',
    'https://picsum.photos/id/1018/600/300',
  ];

  int _current = 0;
  late PageController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8);
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_current < images.length - 1) {
        _current++;
      } else {
        _current = 0;
      }
      _controller.animateToPage(
        _current,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildIndicator(int index) {
    bool isActive = index == _current;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 15 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.buttonColor : AppColors.borderColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.sH125,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.advertisement.length,
              onPageChanged: (index) {
                setState(() => _current = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Stack(
                    children: [
                      CachedImage(
                        borderRadius: BorderRadius.circular(16.r),
                        url: widget.advertisement[index].image,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            widget.advertisement[index].title,
                            style: const TextStyle().medium.setWhiteColor.s18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: AppSizes.sH17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(widget.advertisement.length, _buildIndicator),
          ),
        ],
      ),
    );
  }
}
