part of '../../building_details_imports.dart';

class BuildingDetailsImageSlider extends StatefulWidget {
  const BuildingDetailsImageSlider({super.key});

  @override
  State<BuildingDetailsImageSlider> createState() =>
      _BuildingDetailsImageSliderState();
}

class _BuildingDetailsImageSliderState
    extends State<BuildingDetailsImageSlider> {
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
    _controller = PageController();
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
        SizedBox(
          height: AppSizes.sH338,
          width: AppSizes.sW375,
          child: Stack(
            children: [
              // Sliding Images
              PageView.builder(
                controller: _controller,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() => _current = index);
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),

              // Fixed Back Button
              Positioned(
                top: 16,
                child: CustomBackButton(),
              ),

              // Fixed Favorite Button
              Positioned(
                top: 16,
                left: 16,
                child: CustomCirclurButton(
                  imagepath: AppAssets.svg.favoritePrimaryBorder.path,
                  onTap: () {},
                  height: AppSizes.sH40,
                  width: AppSizes.sW40,
                ),
              ),

              // Bottom Label (changes with image if needed)
              Positioned(
                bottom: 14,
                left: 14,
                child: ChangeContainerBuildingDetails(
                  color: AppColors.containerTextColor1,
                  background_color: AppColors.white,
                  text: LocaleKeys.tire.tr(),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSizes.sH12),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, _buildIndicator),
        ),
      ],
    );
  }
}
