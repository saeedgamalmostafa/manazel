import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manazel/src/config/res/app_sizes.dart';

import '../../../../config/res/color_manager.dart';

class CustomImageSlider extends StatefulWidget {
  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
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
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_current < images.length - 1) {
        _current++;
      } else {
        _current = 0;
      }
      _controller.animateToPage(
        _current,
        duration: Duration(milliseconds: 500),
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
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 3),
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: AppSizes.sH20, left: AppSizes.sW12, right: AppSizes.sW12),
          child: Container(
            height: AppSizes.sH125,
            width: AppSizes.sW323,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => _current = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: AppSizes.sH17),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, _buildIndicator),
        ),
      ],
    );
  }
}
